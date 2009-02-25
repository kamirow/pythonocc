/*
##Copyright 2008-2009 Thomas Paviot
##
##thomas.paviot@free.fr
##
##pythonOCC is a computer program whose purpose is to provide a complete set
##of python bindings for OpenCascade library.
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
*/
%module BinMNaming

%include typemaps.i
%include cmalloc.i
%include cpointer.i
%include carrays.i
%include exception.i

#ifndef _Standard_TypeDef_HeaderFile
#define _Standard_TypeDef_HeaderFile
#define Standard_False (Standard_Boolean) 0
#define Standard_True  (Standard_Boolean) 1
#endif

/*
Exception handling
*/
%{#include <Standard_Failure.hxx>%}
%exception
{
    try
    {
        $action
    } 
    catch(Standard_Failure)
    {
        SWIG_exception(SWIG_RuntimeError,Standard_Failure::Caught()->DynamicType()->Name());
    }
}

/*
Standard_Real & function transformation
*/
%typemap(argout) Standard_Real &OutValue {
    PyObject *o, *o2, *o3;
    o = PyFloat_FromDouble(*$1);
    if ((!$result) || ($result == Py_None)) {
        $result = o;
    } else {
        if (!PyTuple_Check($result)) {
            PyObject *o2 = $result;
            $result = PyTuple_New(1);
            PyTuple_SetItem($result,0,o2);
        }
        o3 = PyTuple_New(1);
        PyTuple_SetItem(o3,0,o);
        o2 = $result;
        $result = PySequence_Concat(o2,o3);
        Py_DECREF(o2);
        Py_DECREF(o3);
    }
}

%typemap(in,numinputs=0) Standard_Real &OutValue(Standard_Real temp) {
    $1 = &temp;
}


%include BinMNaming_dependencies.i


%include BinMNaming_headers.i




%nodefaultctor Handle_BinMNaming_NamingDriver;
class Handle_BinMNaming_NamingDriver : public Handle_BinMDF_ADriver {
	public:
		%feature("autodoc", "1");
		~Handle_BinMNaming_NamingDriver();
		%feature("autodoc", "1");
		Handle_BinMNaming_NamingDriver();
		%feature("autodoc", "1");
		Handle_BinMNaming_NamingDriver(const Handle_BinMNaming_NamingDriver &aHandle);
		%feature("autodoc", "1");
		Handle_BinMNaming_NamingDriver(const BinMNaming_NamingDriver *anItem);
		%feature("autodoc", "1");
		Handle_BinMNaming_NamingDriver const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMNaming_NamingDriver {
	BinMNaming_NamingDriver* GetObject() {
	return (BinMNaming_NamingDriver*)$self->Access();
	}
};

%nodefaultctor Handle_BinMNaming_NamedShapeDriver;
class Handle_BinMNaming_NamedShapeDriver : public Handle_BinMDF_ADriver {
	public:
		%feature("autodoc", "1");
		~Handle_BinMNaming_NamedShapeDriver();
		%feature("autodoc", "1");
		Handle_BinMNaming_NamedShapeDriver();
		%feature("autodoc", "1");
		Handle_BinMNaming_NamedShapeDriver(const Handle_BinMNaming_NamedShapeDriver &aHandle);
		%feature("autodoc", "1");
		Handle_BinMNaming_NamedShapeDriver(const BinMNaming_NamedShapeDriver *anItem);
		%feature("autodoc", "1");
		Handle_BinMNaming_NamedShapeDriver const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMNaming_NamedShapeDriver {
	BinMNaming_NamedShapeDriver* GetObject() {
	return (BinMNaming_NamedShapeDriver*)$self->Access();
	}
};

%nodefaultctor BinMNaming;
class BinMNaming {
	public:
		%feature("autodoc", "1");
		~BinMNaming();
		%feature("autodoc", "1");
		BinMNaming();
		%feature("autodoc", "1");
		void AddDrivers(const Handle_BinMDF_ADriverTable &theDriverTable, const Handle_CDM_MessageDriver &aMsgDrv);

};

%nodefaultctor BinMNaming_NamingDriver;
class BinMNaming_NamingDriver : public BinMDF_ADriver {
	public:
		%feature("autodoc", "1");
		BinMNaming_NamingDriver(const Handle_CDM_MessageDriver &theMessageDriver);
		%feature("autodoc", "1");
		virtual		Handle_TDF_Attribute NewEmpty() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Paste(const BinObjMgt_Persistent &Source, const Handle_TDF_Attribute &Target, BinObjMgt_RRelocationTable & RelocTable) const;
		%feature("autodoc", "1");
		virtual		void Paste(const Handle_TDF_Attribute &Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~BinMNaming_NamingDriver();

};
%extend BinMNaming_NamingDriver {
	Handle_BinMNaming_NamingDriver GetHandle() {
	return *(Handle_BinMNaming_NamingDriver*) &$self;
	}
};

%nodefaultctor BinMNaming_NamedShapeDriver;
class BinMNaming_NamedShapeDriver : public BinMDF_ADriver {
	public:
		%feature("autodoc", "1");
		BinMNaming_NamedShapeDriver(const Handle_CDM_MessageDriver &theMessageDriver);
		%feature("autodoc", "1");
		virtual		Handle_TDF_Attribute NewEmpty() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Paste(const BinObjMgt_Persistent &Source, const Handle_TDF_Attribute &Target, BinObjMgt_RRelocationTable & RelocTable) const;
		%feature("autodoc", "1");
		virtual		void Paste(const Handle_TDF_Attribute &Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable) const;
		%feature("autodoc", "1");
		void ReadShapeSection(std::istream & theIS);
		%feature("autodoc", "1");
		void WriteShapeSection(Standard_OStream & theOS);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		void SetFormatNb(const Standard_Integer theFormatNb);
		%feature("autodoc", "1");
		Standard_Integer GetFormatNb() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~BinMNaming_NamedShapeDriver();

};
%extend BinMNaming_NamedShapeDriver {
	Handle_BinMNaming_NamedShapeDriver GetHandle() {
	return *(Handle_BinMNaming_NamedShapeDriver*) &$self;
	}
};