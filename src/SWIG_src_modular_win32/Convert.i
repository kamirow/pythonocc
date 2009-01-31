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
%module Convert

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


%include Convert_dependencies.i


%include Convert_headers.i


enum Convert_ParameterisationType {
	Convert_TgtThetaOver2,
	Convert_TgtThetaOver2_1,
	Convert_TgtThetaOver2_2,
	Convert_TgtThetaOver2_3,
	Convert_TgtThetaOver2_4,
	Convert_QuasiAngular,
	Convert_RationalC1,
	Convert_Polynomial,
	};



%nodefaultctor Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles;
class Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles : public Handle_TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		~Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles();
		%feature("autodoc", "1");
		Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles();
		%feature("autodoc", "1");
		Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles(const Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles &aHandle);
		%feature("autodoc", "1");
		Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles(const Convert_SequenceNodeOfSequenceOfArray1OfPoles *anItem);
		%feature("autodoc", "1");
		Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles {
	Convert_SequenceNodeOfSequenceOfArray1OfPoles* GetObject() {
	return (Convert_SequenceNodeOfSequenceOfArray1OfPoles*)$self->Access();
	}
};

%nodefaultctor Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles2d;
class Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles2d : public Handle_TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		~Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles2d();
		%feature("autodoc", "1");
		Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles2d();
		%feature("autodoc", "1");
		Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles2d(const Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles2d &aHandle);
		%feature("autodoc", "1");
		Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles2d(const Convert_SequenceNodeOfSequenceOfArray1OfPoles2d *anItem);
		%feature("autodoc", "1");
		Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles2d const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles2d {
	Convert_SequenceNodeOfSequenceOfArray1OfPoles2d* GetObject() {
	return (Convert_SequenceNodeOfSequenceOfArray1OfPoles2d*)$self->Access();
	}
};

%nodefaultctor Convert_CompPolynomialToPoles;
class Convert_CompPolynomialToPoles {
	public:
		%feature("autodoc", "1");
		~Convert_CompPolynomialToPoles();
		%feature("autodoc", "1");
		Convert_CompPolynomialToPoles(const Standard_Integer NumCurves, const Standard_Integer Continuity, const Standard_Integer Dimension, const Standard_Integer MaxDegree, const Handle_TColStd_HArray1OfInteger &NumCoeffPerCurve, const Handle_TColStd_HArray1OfReal &Coefficients, const Handle_TColStd_HArray2OfReal &PolynomialIntervals, const Handle_TColStd_HArray1OfReal &TrueIntervals);
		%feature("autodoc", "1");
		Convert_CompPolynomialToPoles(const Standard_Integer NumCurves, const Standard_Integer Dimension, const Standard_Integer MaxDegree, const TColStd_Array1OfInteger &Continuity, const TColStd_Array1OfInteger &NumCoeffPerCurve, const TColStd_Array1OfReal &Coefficients, const TColStd_Array2OfReal &PolynomialIntervals, const TColStd_Array1OfReal &TrueIntervals);
		%feature("autodoc", "1");
		Convert_CompPolynomialToPoles(const Standard_Integer Dimension, const Standard_Integer MaxDegree, const Standard_Integer Degree, const TColStd_Array1OfReal &Coefficients, const TColStd_Array1OfReal &PolynomialIntervals, const TColStd_Array1OfReal &TrueIntervals);
		%feature("autodoc", "1");
		Standard_Integer NbPoles() const;
		%feature("autodoc", "1");
		void Poles(Handle_TColStd_HArray2OfReal & Poles) const;
		%feature("autodoc", "1");
		Standard_Integer Degree() const;
		%feature("autodoc", "1");
		Standard_Integer NbKnots() const;
		%feature("autodoc", "1");
		void Knots(Handle_TColStd_HArray1OfReal & K) const;
		%feature("autodoc", "1");
		void Multiplicities(Handle_TColStd_HArray1OfInteger & M) const;
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;

};

%nodefaultctor Convert_ConicToBSplineCurve;
class Convert_ConicToBSplineCurve {
	public:
		%feature("autodoc", "1");
		~Convert_ConicToBSplineCurve();
		%feature("autodoc", "1");
		Standard_Integer Degree() const;
		%feature("autodoc", "1");
		Standard_Integer NbPoles() const;
		%feature("autodoc", "1");
		Standard_Integer NbKnots() const;
		%feature("autodoc", "1");
		Standard_Boolean IsPeriodic() const;
		%feature("autodoc", "1");
		gp_Pnt2d Pole(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Standard_Real Weight(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Standard_Real Knot(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Standard_Integer Multiplicity(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void BuildCosAndSin(const Convert_ParameterisationType Parametrisation, Handle_TColStd_HArray1OfReal & CosNumerator, Handle_TColStd_HArray1OfReal & SinNumerator, Handle_TColStd_HArray1OfReal & Denominator, Standard_Integer & Degree, Handle_TColStd_HArray1OfReal & Knots, Handle_TColStd_HArray1OfInteger & Mults) const;
		%feature("autodoc", "1");
		void BuildCosAndSin(const Convert_ParameterisationType Parametrisation, const Standard_Real UFirst, const Standard_Real ULast, Handle_TColStd_HArray1OfReal & CosNumerator, Handle_TColStd_HArray1OfReal & SinNumerator, Handle_TColStd_HArray1OfReal & Denominator, Standard_Integer & Degree, Handle_TColStd_HArray1OfReal & Knots, Handle_TColStd_HArray1OfInteger & Mults) const;

};

%nodefaultctor Convert_ElementarySurfaceToBSplineSurface;
class Convert_ElementarySurfaceToBSplineSurface {
	public:
		%feature("autodoc", "1");
		~Convert_ElementarySurfaceToBSplineSurface();
		%feature("autodoc", "1");
		Standard_Integer UDegree() const;
		%feature("autodoc", "1");
		Standard_Integer VDegree() const;
		%feature("autodoc", "1");
		Standard_Integer NbUPoles() const;
		%feature("autodoc", "1");
		Standard_Integer NbVPoles() const;
		%feature("autodoc", "1");
		Standard_Integer NbUKnots() const;
		%feature("autodoc", "1");
		Standard_Integer NbVKnots() const;
		%feature("autodoc", "1");
		Standard_Boolean IsUPeriodic() const;
		%feature("autodoc", "1");
		Standard_Boolean IsVPeriodic() const;
		%feature("autodoc", "1");
		gp_Pnt Pole(const Standard_Integer UIndex, const Standard_Integer VIndex) const;
		%feature("autodoc", "1");
		Standard_Real Weight(const Standard_Integer UIndex, const Standard_Integer VIndex) const;
		%feature("autodoc", "1");
		Standard_Real UKnot(const Standard_Integer UIndex) const;
		%feature("autodoc", "1");
		Standard_Real VKnot(const Standard_Integer UIndex) const;
		%feature("autodoc", "1");
		Standard_Integer UMultiplicity(const Standard_Integer UIndex) const;
		%feature("autodoc", "1");
		Standard_Integer VMultiplicity(const Standard_Integer VIndex) const;

};

%nodefaultctor Convert_ConeToBSplineSurface;
class Convert_ConeToBSplineSurface : public Convert_ElementarySurfaceToBSplineSurface {
	public:
		%feature("autodoc", "1");
		~Convert_ConeToBSplineSurface();
		%feature("autodoc", "1");
		Convert_ConeToBSplineSurface(const gp_Cone &C, const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2);
		%feature("autodoc", "1");
		Convert_ConeToBSplineSurface(const gp_Cone &C, const Standard_Real V1, const Standard_Real V2);

};

%nodefaultctor Convert_ParabolaToBSplineCurve;
class Convert_ParabolaToBSplineCurve : public Convert_ConicToBSplineCurve {
	public:
		%feature("autodoc", "1");
		~Convert_ParabolaToBSplineCurve();
		%feature("autodoc", "1");
		Convert_ParabolaToBSplineCurve(const gp_Parab2d &Prb, const Standard_Real U1, const Standard_Real U2);

};

%nodefaultctor Convert_TorusToBSplineSurface;
class Convert_TorusToBSplineSurface : public Convert_ElementarySurfaceToBSplineSurface {
	public:
		%feature("autodoc", "1");
		~Convert_TorusToBSplineSurface();
		%feature("autodoc", "1");
		Convert_TorusToBSplineSurface(const gp_Torus &T, const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2);
		%feature("autodoc", "1");
		Convert_TorusToBSplineSurface(const gp_Torus &T, const Standard_Real Param1, const Standard_Real Param2, const Standard_Boolean UTrim=1);
		%feature("autodoc", "1");
		Convert_TorusToBSplineSurface(const gp_Torus &T);

};

%nodefaultctor Convert_CircleToBSplineCurve;
class Convert_CircleToBSplineCurve : public Convert_ConicToBSplineCurve {
	public:
		%feature("autodoc", "1");
		~Convert_CircleToBSplineCurve();
		%feature("autodoc", "1");
		Convert_CircleToBSplineCurve(const gp_Circ2d &C, const Convert_ParameterisationType Parameterisation=Convert_TgtThetaOver2);
		%feature("autodoc", "1");
		Convert_CircleToBSplineCurve(const gp_Circ2d &C, const Standard_Real U1, const Standard_Real U2, const Convert_ParameterisationType Parameterisation=Convert_TgtThetaOver2);

};

%nodefaultctor Convert_HyperbolaToBSplineCurve;
class Convert_HyperbolaToBSplineCurve : public Convert_ConicToBSplineCurve {
	public:
		%feature("autodoc", "1");
		~Convert_HyperbolaToBSplineCurve();
		%feature("autodoc", "1");
		Convert_HyperbolaToBSplineCurve(const gp_Hypr2d &H, const Standard_Real U1, const Standard_Real U2);

};

%nodefaultctor Convert_GridPolynomialToPoles;
class Convert_GridPolynomialToPoles {
	public:
		%feature("autodoc", "1");
		~Convert_GridPolynomialToPoles();
		%feature("autodoc", "1");
		Convert_GridPolynomialToPoles(const Standard_Integer MaxUDegree, const Standard_Integer MaxVDegree, const Handle_TColStd_HArray1OfInteger &NumCoeff, const Handle_TColStd_HArray1OfReal &Coefficients, const Handle_TColStd_HArray1OfReal &PolynomialUIntervals, const Handle_TColStd_HArray1OfReal &PolynomialVIntervals);
		%feature("autodoc", "1");
		Convert_GridPolynomialToPoles(const Standard_Integer NbUSurfaces, const Standard_Integer NBVSurfaces, const Standard_Integer UContinuity, const Standard_Integer VContinuity, const Standard_Integer MaxUDegree, const Standard_Integer MaxVDegree, const Handle_TColStd_HArray2OfInteger &NumCoeffPerSurface, const Handle_TColStd_HArray1OfReal &Coefficients, const Handle_TColStd_HArray1OfReal &PolynomialUIntervals, const Handle_TColStd_HArray1OfReal &PolynomialVIntervals, const Handle_TColStd_HArray1OfReal &TrueUIntervals, const Handle_TColStd_HArray1OfReal &TrueVIntervals);
		%feature("autodoc", "1");
		void Perform(const Standard_Integer UContinuity, const Standard_Integer VContinuity, const Standard_Integer MaxUDegree, const Standard_Integer MaxVDegree, const Handle_TColStd_HArray2OfInteger &NumCoeffPerSurface, const Handle_TColStd_HArray1OfReal &Coefficients, const Handle_TColStd_HArray1OfReal &PolynomialUIntervals, const Handle_TColStd_HArray1OfReal &PolynomialVIntervals, const Handle_TColStd_HArray1OfReal &TrueUIntervals, const Handle_TColStd_HArray1OfReal &TrueVIntervals);
		%feature("autodoc", "1");
		Standard_Integer NbUPoles() const;
		%feature("autodoc", "1");
		Standard_Integer NbVPoles() const;
		%feature("autodoc", "1");
		const Handle_TColgp_HArray2OfPnt & Poles() const;
		%feature("autodoc", "1");
		Standard_Integer UDegree() const;
		%feature("autodoc", "1");
		Standard_Integer VDegree() const;
		%feature("autodoc", "1");
		Standard_Integer NbUKnots() const;
		%feature("autodoc", "1");
		Standard_Integer NbVKnots() const;
		%feature("autodoc", "1");
		const Handle_TColStd_HArray1OfReal & UKnots() const;
		%feature("autodoc", "1");
		const Handle_TColStd_HArray1OfReal & VKnots() const;
		%feature("autodoc", "1");
		const Handle_TColStd_HArray1OfInteger & UMultiplicities() const;
		%feature("autodoc", "1");
		const Handle_TColStd_HArray1OfInteger & VMultiplicities() const;
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;

};

%nodefaultctor Convert_SequenceOfArray1OfPoles2d;
class Convert_SequenceOfArray1OfPoles2d : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "1");
		Convert_SequenceOfArray1OfPoles2d();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~Convert_SequenceOfArray1OfPoles2d();
		%feature("autodoc", "1");
		const Convert_SequenceOfArray1OfPoles2d & Assign(const Convert_SequenceOfArray1OfPoles2d &Other);
		%feature("autodoc", "1");
		void Append(const Handle_TColgp_HArray1OfPnt2d &T);
		%feature("autodoc", "1");
		void Append(Convert_SequenceOfArray1OfPoles2d & S);
		%feature("autodoc", "1");
		void Prepend(const Handle_TColgp_HArray1OfPnt2d &T);
		%feature("autodoc", "1");
		void Prepend(Convert_SequenceOfArray1OfPoles2d & S);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, const Handle_TColgp_HArray1OfPnt2d &I);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, Convert_SequenceOfArray1OfPoles2d & S);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, const Handle_TColgp_HArray1OfPnt2d &T);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, Convert_SequenceOfArray1OfPoles2d & S);
		%feature("autodoc", "1");
		const Handle_TColgp_HArray1OfPnt2d & First() const;
		%feature("autodoc", "1");
		const Handle_TColgp_HArray1OfPnt2d & Last() const;
		%feature("autodoc", "1");
		void Split(const Standard_Integer Index, Convert_SequenceOfArray1OfPoles2d & S);
		%feature("autodoc", "1");
		const Handle_TColgp_HArray1OfPnt2d & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_TColgp_HArray1OfPnt2d & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_TColgp_HArray1OfPnt2d &I);
		%feature("autodoc", "1");
		Handle_TColgp_HArray1OfPnt2d & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_TColgp_HArray1OfPnt2d & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

};

%nodefaultctor Convert_SphereToBSplineSurface;
class Convert_SphereToBSplineSurface : public Convert_ElementarySurfaceToBSplineSurface {
	public:
		%feature("autodoc", "1");
		~Convert_SphereToBSplineSurface();
		%feature("autodoc", "1");
		Convert_SphereToBSplineSurface(const gp_Sphere &Sph, const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2);
		%feature("autodoc", "1");
		Convert_SphereToBSplineSurface(const gp_Sphere &Sph, const Standard_Real Param1, const Standard_Real Param2, const Standard_Boolean UTrim=1);
		%feature("autodoc", "1");
		Convert_SphereToBSplineSurface(const gp_Sphere &Sph);

};

%nodefaultctor Convert_CompBezierCurvesToBSplineCurve;
class Convert_CompBezierCurvesToBSplineCurve {
	public:
		%feature("autodoc", "1");
		~Convert_CompBezierCurvesToBSplineCurve();
		%feature("autodoc", "1");
		Convert_CompBezierCurvesToBSplineCurve(const Standard_Real AngularTolerance=1.00000000000000004792173602385929598312941379845e-4);
		%feature("autodoc", "1");
		void AddCurve(const TColgp_Array1OfPnt &Poles);
		%feature("autodoc", "1");
		void Perform();
		%feature("autodoc", "1");
		Standard_Integer Degree() const;
		%feature("autodoc", "1");
		Standard_Integer NbPoles() const;
		%feature("autodoc", "1");
		void Poles(TColgp_Array1OfPnt & Poles) const;
		%feature("autodoc", "1");
		Standard_Integer NbKnots() const;
		%feature("autodoc", "1");
		void KnotsAndMults(TColStd_Array1OfReal & Knots, TColStd_Array1OfInteger & Mults) const;

};

%nodefaultctor Convert_SequenceOfArray1OfPoles;
class Convert_SequenceOfArray1OfPoles : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "1");
		Convert_SequenceOfArray1OfPoles();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~Convert_SequenceOfArray1OfPoles();
		%feature("autodoc", "1");
		const Convert_SequenceOfArray1OfPoles & Assign(const Convert_SequenceOfArray1OfPoles &Other);
		%feature("autodoc", "1");
		void Append(const Handle_TColgp_HArray1OfPnt &T);
		%feature("autodoc", "1");
		void Append(Convert_SequenceOfArray1OfPoles & S);
		%feature("autodoc", "1");
		void Prepend(const Handle_TColgp_HArray1OfPnt &T);
		%feature("autodoc", "1");
		void Prepend(Convert_SequenceOfArray1OfPoles & S);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, const Handle_TColgp_HArray1OfPnt &I);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, Convert_SequenceOfArray1OfPoles & S);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, const Handle_TColgp_HArray1OfPnt &T);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, Convert_SequenceOfArray1OfPoles & S);
		%feature("autodoc", "1");
		const Handle_TColgp_HArray1OfPnt & First() const;
		%feature("autodoc", "1");
		const Handle_TColgp_HArray1OfPnt & Last() const;
		%feature("autodoc", "1");
		void Split(const Standard_Integer Index, Convert_SequenceOfArray1OfPoles & S);
		%feature("autodoc", "1");
		const Handle_TColgp_HArray1OfPnt & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_TColgp_HArray1OfPnt & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_TColgp_HArray1OfPnt &I);
		%feature("autodoc", "1");
		Handle_TColgp_HArray1OfPnt & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_TColgp_HArray1OfPnt & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

};

%nodefaultctor Convert_CylinderToBSplineSurface;
class Convert_CylinderToBSplineSurface : public Convert_ElementarySurfaceToBSplineSurface {
	public:
		%feature("autodoc", "1");
		~Convert_CylinderToBSplineSurface();
		%feature("autodoc", "1");
		Convert_CylinderToBSplineSurface(const gp_Cylinder &Cyl, const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2);
		%feature("autodoc", "1");
		Convert_CylinderToBSplineSurface(const gp_Cylinder &Cyl, const Standard_Real V1, const Standard_Real V2);

};

%nodefaultctor Convert_SequenceNodeOfSequenceOfArray1OfPoles;
class Convert_SequenceNodeOfSequenceOfArray1OfPoles : public TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		Convert_SequenceNodeOfSequenceOfArray1OfPoles(const Handle_TColgp_HArray1OfPnt &I, const TCollection_SeqNodePtr &n, const TCollection_SeqNodePtr &p);
		%feature("autodoc", "1");
		Handle_TColgp_HArray1OfPnt & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~Convert_SequenceNodeOfSequenceOfArray1OfPoles();

};
%extend Convert_SequenceNodeOfSequenceOfArray1OfPoles {
	Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles GetHandle() {
	return *(Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles*) &$self;
	}
};

%nodefaultctor Convert_EllipseToBSplineCurve;
class Convert_EllipseToBSplineCurve : public Convert_ConicToBSplineCurve {
	public:
		%feature("autodoc", "1");
		~Convert_EllipseToBSplineCurve();
		%feature("autodoc", "1");
		Convert_EllipseToBSplineCurve(const gp_Elips2d &E, const Convert_ParameterisationType Parameterisation=Convert_TgtThetaOver2);
		%feature("autodoc", "1");
		Convert_EllipseToBSplineCurve(const gp_Elips2d &E, const Standard_Real U1, const Standard_Real U2, const Convert_ParameterisationType Parameterisation=Convert_TgtThetaOver2);

};

%nodefaultctor Convert_CompBezierCurves2dToBSplineCurve2d;
class Convert_CompBezierCurves2dToBSplineCurve2d {
	public:
		%feature("autodoc", "1");
		~Convert_CompBezierCurves2dToBSplineCurve2d();
		%feature("autodoc", "1");
		Convert_CompBezierCurves2dToBSplineCurve2d(const Standard_Real AngularTolerance=1.00000000000000004792173602385929598312941379845e-4);
		%feature("autodoc", "1");
		void AddCurve(const TColgp_Array1OfPnt2d &Poles);
		%feature("autodoc", "1");
		void Perform();
		%feature("autodoc", "1");
		Standard_Integer Degree() const;
		%feature("autodoc", "1");
		Standard_Integer NbPoles() const;
		%feature("autodoc", "1");
		void Poles(TColgp_Array1OfPnt2d & Poles) const;
		%feature("autodoc", "1");
		Standard_Integer NbKnots() const;
		%feature("autodoc", "1");
		void KnotsAndMults(TColStd_Array1OfReal & Knots, TColStd_Array1OfInteger & Mults) const;

};

%nodefaultctor Convert_SequenceNodeOfSequenceOfArray1OfPoles2d;
class Convert_SequenceNodeOfSequenceOfArray1OfPoles2d : public TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		Convert_SequenceNodeOfSequenceOfArray1OfPoles2d(const Handle_TColgp_HArray1OfPnt2d &I, const TCollection_SeqNodePtr &n, const TCollection_SeqNodePtr &p);
		%feature("autodoc", "1");
		Handle_TColgp_HArray1OfPnt2d & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~Convert_SequenceNodeOfSequenceOfArray1OfPoles2d();

};
%extend Convert_SequenceNodeOfSequenceOfArray1OfPoles2d {
	Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles2d GetHandle() {
	return *(Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles2d*) &$self;
	}
};