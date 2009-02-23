#!/usr/bin/env python

##Copyright 2008 Thomas Paviot
##
##thomas.paviot@free.fr.fr
##
##pythonOCC is a computer program whose purpose is to provide a complete set
##of python bindings for OpenCasacde library.
##
##This software is governed by the CeCILL license under French law and
##abiding by the rules of distribution of free software.  You can  use, 
##modify and/ or redistribute the software under the terms of the CeCILL
##license as circulated by CEA, CNRS and INRIA at the following URL
##"http://www.cecill.info". 
##
##As a counterpart to the access to the source code and  rights to copy,
##modify and redistribute granted by the license, users are provided only
##with a limited warranty  and the software's author,  the holder of the
##economic rights,  and the successive licensors  have only  limited
##liability. 
##
##In this respect, the user's attention is drawn to the risks associated
##with loading,  using,  modifying and/or developing or reproducing the
##software by the user in light of its specific status of free software,
##that may mean  that it is complicated to manipulate,  and  that  also
##therefore means  that it is reserved for developers  and  experienced
##professionals having in-depth computer knowledge. Users are therefore
##encouraged to load and test the software's suitability as regards their
##requirements in conditions enabling the security of their systems and/or 
##data to be ensured and,  more generally, to use and operate it in the 
##same conditions as regards security. 
##
##The fact that you are presently reading this means that you have had
##knowledge of the CeCILL license and that you accept its terms.

import os, os.path

import OCC.Visualization
import OCC.V3d
import OCC.V2d
import OCC.AIS
import OCC.AIS2D

import sys

class BaseDriver(object):
    """
    The base driver class for both Driver2d and Driver3d classes
    """
    def __init__(self, window_handle):
        self._window_handle = window_handle
        self._inited = False
        self._local_context_opened = False
        self.Context_handle = None
        self.Viewer_handle = None
        self.View_handle = None
        self.Context = None
        self.Viewer = None
        self.View = None
        self._objects_displayed = []#list to save in memory displayed objects
    
    def MoveTo(self,X,Y):
        self.Context.MoveTo(X,Y,self.View_handle)
      
    def FitAll(self):
        self.View.ZFitAll()
        self.View.FitAll()
        
    def Create(self):
        try:
            os.environ["CSF_GraphicShr"]
        except KeyError:
            raise "Please set the CSF_GraphicShr environment variable."
        if sys.platform!='win32':
            try:
                os.environ['DISPLAY']
            except KeyError:
                raise "Please set the DISPLAY environment variable."
        self.Init(self._window_handle)
        self.Context_handle = self.GetContext()
        self.Viewer_handle = self.GetViewer()
        self.View_handle = self.GetView()
        self.Context = self.Context_handle.GetObject()
        self.Viewer = self.Viewer_handle.GetObject()
        self.View = self.View_handle.GetObject()
        self._inited = True
    
        
class Viewer2d(BaseDriver, OCC.Visualization.Display2d):   
    def __init__(self, window_handle ):
        BaseDriver.__init__(self,window_handle)
        OCC.Visualization.Display2d.__init__(self)        
    
    def OnResize(self):
        self.View.MustBeResized(OCC.V2d.V2d_TOWRE_ENLARGE_SPACE)
    
    def DisplayShape(self,shape,material=None,texture=None):
        if material:#careful: != operator segfaults
            self.View.SetSurfaceDetail(OCC._TEX_ALL)
            shape_to_display = OCC.AIS.AIS_TexturedShape(shape)
            shape_to_display.SetMaterial(material)
            if texture:
                filename, toScaleU, toScaleV, toRepeatU, toRepeatV, originU, originV = texture.GetProperties()
                shape_to_display.SetTextureFileName(OCC.TCollection.TCollection_AsciiString(filename))
                shape_to_display.SetTextureMapOn()
                shape_to_display.SetTextureScale(True, toScaleU, toScaleV)
                shape_to_display.SetTextureRepeat(True, toRepeatU, toRepeatV)
                shape_to_display.SetTextureOrigin(True, originU, originV)
                shape_to_display.SetDisplayMode(3);
        else:
            shape_to_display = OCC.AIS.AIS_Shape(shape)
        self._objects_displayed.append(shape_to_display)
        self.Context.Display(shape_to_display.GetHandle())
        self.FitAll()
        
class Viewer3d(BaseDriver, OCC.Visualization.Display3d):
    def __init__(self, window_handle ):
        BaseDriver.__init__(self,window_handle)
        OCC.Visualization.Display3d.__init__(self)
          
    def OnResize(self):
        self.View.MustBeResized()

    def ResetView(self):
        self.View.Reset()
    
    def Repaint(self):
        self.Viewer.Redraw()
        
    def SetModeWireFrame(self):
        self.View.SetComputedMode(False)
        self.Context.SetDisplayMode(OCC.AIS.AIS_WireFrame)

    def SetModeShaded(self):
        self.View.SetComputedMode(False)
        self.View.SetAntialiasingOff()
        self.Context.SetDisplayMode(OCC.AIS.AIS_Shaded)
     
    def SetModeQuickHLR(self):
        self.View.SetComputedMode(True)
        self.Context.SetDisplayMode(OCC.AIS.AIS_QuickHLR)
    
    def SetModeExactHLR(self):
        self.View.SetComputedMode(True)
        self.Context.SetDisplayMode(OCC.AIS.AIS_ExactHLR)
    
    def View_Top(self):
        self.View.SetProj(OCC._Zpos) 

    def View_Bottom(self):
        self.View.SetProj(OCC._Zneg)
        
    def View_Left(self):
        self.View.SetProj(OCC._Xneg)

    def View_Right(self):
        self.View.SetProj(OCC._Xpos)

    def View_Front(self):
        self.View.SetProj(OCC._Yneg)

    def View_Rear(self):
        self.View.SetProj(OCC._Ypos)

    def View_Iso(self):
        self.View.SetProj(OCC._XposYnegZpos)
        
    def ExportToImage(self,Filename):
        self.View.Dump(Filename)

    def SetBackgroundImage(self, Filename, Stretch = True):
        if (Stretch):
            self.View.SetBackgroundImage(Filename, OCC.Aspect.Aspect_FM_STRETCH, True)
        else:
            self.View.SetBackgroundImage(Filename, OCC.Aspect.Aspect_FM_NONE, True )

    def DisplayShape(self,shape,material=None,texture=None):
        if material:#careful: != operator segfaults
            self.View.SetSurfaceDetail(OCC._TEX_ALL)
            shape_to_display = OCC.AIS.AIS_TexturedShape(shape)
            shape_to_display.SetMaterial(material)
            if texture:
                filename, toScaleU, toScaleV, toRepeatU, toRepeatV, originU, originV = texture.GetProperties()
                shape_to_display.SetTextureFileName(OCC.TCollection.TCollection_AsciiString(filename))
                shape_to_display.SetTextureMapOn()
                shape_to_display.SetTextureScale(True, toScaleU, toScaleV)
                shape_to_display.SetTextureRepeat(True, toRepeatU, toRepeatV)
                shape_to_display.SetTextureOrigin(True, originU, originV)
                shape_to_display.SetDisplayMode(3);
        else:
            shape_to_display = OCC.AIS.AIS_Shape(shape)
        self._objects_displayed.append(shape_to_display)
        self.Context.Display(shape_to_display.GetHandle())
        self.FitAll()
    
    def DisplayTriedron(self):
        self.View.TriedronDisplay(OCC.Aspect.Aspect_TOTP_RIGHT_LOWER, OCC.Quantity.Quantity_NOC_WHITE, 0.08,  OCC.V3d.V3d_WIREFRAME)
        self.Repaint()
    
    def EnableAntiAliasing(self):
        self.View.SetAntialiasingOn()
        self.Repaint()

    def DisableAntiAliasing(self):
        self.View.SetAntialiasingOff()
        self.Repaint()
    
    def EraseAll(self):
        self._objects_displayed = []
        self.Context.EraseAll()
        
    def Tumble(self,NumImages,Animation = True):
        self.View.Tumble(NumImages, Animation)
        
    def Pan(self,Dx,Dy):
        self.View.Pan(Dx,Dy)
    
    def SetSelectionMode(self,mode = OCC.TopAbs.TopAbs_FACE):
        self.Context.CloseAllContexts()
        self.Context.OpenLocalContext()
        self.Context.ActivateStandardMode(mode)
    
    def OpenLocalContext(self):
        if not self._local_context_opened:
            self.Context.OpenLocalContext()
            self._local_context_opened = True
        
    def SetSelectionModeVertex(self):
        self.OpenLocalContext()
        self.Context.ActivateStandardMode(OCC.TopAbs.TopAbs_VERTEX)
        
    def SetSelectionModeEdge(self):
        self.OpenLocalContext()
        self.Context.ActivateStandardMode(OCC.TopAbs.TopAbs_EDGE)
        
    def SetSelectionModeFace(self):
        self.OpenLocalContext()
        self.Context.ActivateStandardMode(OCC.TopAbs.TopAbs_FACE)        
        
    def SetSelectionModeShape(self):
        self.Context.CloseAllContexts()
        self.Context.OpenLocalContext()
        self.Context.ActivateStandardMode(OCC.TopAbs.TopAbs_SHAPE)        
    
    def SetSelectionModeNeutral(self):
        self.Context.CloseAllContexts()
        
    def Select(self,X,Y):
        self.Context.Select()
        self.Context.InitSelected()
        print self.Context.MoreSelected()
        if self.Context.MoreSelected():
            if self.Context.HasSelectedShape():
                print "Something selected"
                selected_shape = self.Context.SelectedShape()
                print selected_shape
        else:
            print "Nothing selected"
            selected_shape = None
        
    def Rotation(self,X,Y):
        self.View.Rotation(X,Y)
    
    def DynamicZoom(self,X1,Y1,X2,Y2):
        self.View.Zoom(X1,Y1,X2,Y2)
    
    def ZoomArea(self,X1,Y1,X2,Y2):
        self.View.WindowFit(X1,Y1,X2,Y2)
    
    def Zoom(self,X,Y):
        self.View.Zoom(X,Y)
    
    def StartRotation(self,X,Y):
        self.View.StartRotation(X,Y)
    