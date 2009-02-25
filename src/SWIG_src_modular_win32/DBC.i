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
%module DBC

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


%include DBC_dependencies.i


%include DBC_headers.i

typedef void * DBC_DBVArray;



%nodefaultctor Handle_DBC_VArrayNodeOfVArrayOfInteger;
class Handle_DBC_VArrayNodeOfVArrayOfInteger : public Handle_PStandard_ArrayNode {
	public:
		%feature("autodoc", "1");
		~Handle_DBC_VArrayNodeOfVArrayOfInteger();
		%feature("autodoc", "1");
		Handle_DBC_VArrayNodeOfVArrayOfInteger();
		%feature("autodoc", "1");
		Handle_DBC_VArrayNodeOfVArrayOfInteger(const Handle_DBC_VArrayNodeOfVArrayOfInteger &aHandle);
		%feature("autodoc", "1");
		Handle_DBC_VArrayNodeOfVArrayOfInteger(const DBC_VArrayNodeOfVArrayOfInteger *anItem);
		%feature("autodoc", "1");
		Handle_DBC_VArrayNodeOfVArrayOfInteger const DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_DBC_VArrayNodeOfVArrayOfInteger {
	DBC_VArrayNodeOfVArrayOfInteger* GetObject() {
	return (DBC_VArrayNodeOfVArrayOfInteger*)$self->Access();
	}
};

%nodefaultctor Handle_DBC_VArrayNodeOfVArrayOfExtCharacter;
class Handle_DBC_VArrayNodeOfVArrayOfExtCharacter : public Handle_PStandard_ArrayNode {
	public:
		%feature("autodoc", "1");
		~Handle_DBC_VArrayNodeOfVArrayOfExtCharacter();
		%feature("autodoc", "1");
		Handle_DBC_VArrayNodeOfVArrayOfExtCharacter();
		%feature("autodoc", "1");
		Handle_DBC_VArrayNodeOfVArrayOfExtCharacter(const Handle_DBC_VArrayNodeOfVArrayOfExtCharacter &aHandle);
		%feature("autodoc", "1");
		Handle_DBC_VArrayNodeOfVArrayOfExtCharacter(const DBC_VArrayNodeOfVArrayOfExtCharacter *anItem);
		%feature("autodoc", "1");
		Handle_DBC_VArrayNodeOfVArrayOfExtCharacter const DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_DBC_VArrayNodeOfVArrayOfExtCharacter {
	DBC_VArrayNodeOfVArrayOfExtCharacter* GetObject() {
	return (DBC_VArrayNodeOfVArrayOfExtCharacter*)$self->Access();
	}
};

%nodefaultctor Handle_DBC_VArrayNodeOfVArrayOfCharacter;
class Handle_DBC_VArrayNodeOfVArrayOfCharacter : public Handle_PStandard_ArrayNode {
	public:
		%feature("autodoc", "1");
		~Handle_DBC_VArrayNodeOfVArrayOfCharacter();
		%feature("autodoc", "1");
		Handle_DBC_VArrayNodeOfVArrayOfCharacter();
		%feature("autodoc", "1");
		Handle_DBC_VArrayNodeOfVArrayOfCharacter(const Handle_DBC_VArrayNodeOfVArrayOfCharacter &aHandle);
		%feature("autodoc", "1");
		Handle_DBC_VArrayNodeOfVArrayOfCharacter(const DBC_VArrayNodeOfVArrayOfCharacter *anItem);
		%feature("autodoc", "1");
		Handle_DBC_VArrayNodeOfVArrayOfCharacter const DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_DBC_VArrayNodeOfVArrayOfCharacter {
	DBC_VArrayNodeOfVArrayOfCharacter* GetObject() {
	return (DBC_VArrayNodeOfVArrayOfCharacter*)$self->Access();
	}
};

%nodefaultctor Handle_DBC_VArrayNodeOfVArrayOfReal;
class Handle_DBC_VArrayNodeOfVArrayOfReal : public Handle_PStandard_ArrayNode {
	public:
		%feature("autodoc", "1");
		~Handle_DBC_VArrayNodeOfVArrayOfReal();
		%feature("autodoc", "1");
		Handle_DBC_VArrayNodeOfVArrayOfReal();
		%feature("autodoc", "1");
		Handle_DBC_VArrayNodeOfVArrayOfReal(const Handle_DBC_VArrayNodeOfVArrayOfReal &aHandle);
		%feature("autodoc", "1");
		Handle_DBC_VArrayNodeOfVArrayOfReal(const DBC_VArrayNodeOfVArrayOfReal *anItem);
		%feature("autodoc", "1");
		Handle_DBC_VArrayNodeOfVArrayOfReal const DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_DBC_VArrayNodeOfVArrayOfReal {
	DBC_VArrayNodeOfVArrayOfReal* GetObject() {
	return (DBC_VArrayNodeOfVArrayOfReal*)$self->Access();
	}
};

%nodefaultctor DBC_VArrayTNodeOfVArrayOfCharacter;
class DBC_VArrayTNodeOfVArrayOfCharacter {
	public:
		%feature("autodoc", "1");
		~DBC_VArrayTNodeOfVArrayOfCharacter();
		%feature("autodoc", "1");
		DBC_VArrayTNodeOfVArrayOfCharacter();
		%feature("autodoc", "1");
		DBC_VArrayTNodeOfVArrayOfCharacter(const Standard_Character &aValue);
		%feature("autodoc", "1");
		void SetValue(const Standard_Character &aValue);
		%feature("autodoc", "1");
		Standard_Address Value() const;

};

%nodefaultctor DBC_VArrayNodeOfVArrayOfExtCharacter;
class DBC_VArrayNodeOfVArrayOfExtCharacter : public PStandard_ArrayNode {
	public:
		%feature("autodoc", "1");
		DBC_VArrayNodeOfVArrayOfExtCharacter();
		%feature("autodoc", "1");
		DBC_VArrayNodeOfVArrayOfExtCharacter(const Standard_ExtCharacter &aValue);
		%feature("autodoc", "1");
		void SetValue(const Standard_ExtCharacter &aValue);
		%feature("autodoc", "1");
		Standard_Address Value() const;
		%feature("autodoc", "1");
		DBC_VArrayNodeOfVArrayOfExtCharacter(const Storage_stCONSTclCOM &a);
		%feature("autodoc", "1");
		Standard_ExtCharacter _CSFDB_GetDBC_VArrayNodeOfVArrayOfExtCharactermyValue() const;
		%feature("autodoc", "1");
		void _CSFDB_SetDBC_VArrayNodeOfVArrayOfExtCharactermyValue(const Standard_ExtCharacter p);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~DBC_VArrayNodeOfVArrayOfExtCharacter();

};
%extend DBC_VArrayNodeOfVArrayOfExtCharacter {
	Handle_DBC_VArrayNodeOfVArrayOfExtCharacter GetHandle() {
	return *(Handle_DBC_VArrayNodeOfVArrayOfExtCharacter*) &$self;
	}
};

%nodefaultctor DBC_VArrayTNodeOfVArrayOfInteger;
class DBC_VArrayTNodeOfVArrayOfInteger {
	public:
		%feature("autodoc", "1");
		~DBC_VArrayTNodeOfVArrayOfInteger();
		%feature("autodoc", "1");
		DBC_VArrayTNodeOfVArrayOfInteger();
		%feature("autodoc", "1");
		DBC_VArrayTNodeOfVArrayOfInteger(const Standard_Integer &aValue);
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer &aValue);
		%feature("autodoc", "1");
		Standard_Address Value() const;

};

%nodefaultctor DBC_BaseArray;
class DBC_BaseArray {
	public:
		%feature("autodoc", "1");
		DBC_BaseArray();
		%feature("autodoc", "1");
		DBC_BaseArray(const Standard_Integer Size);
		%feature("autodoc", "1");
		DBC_BaseArray(const DBC_BaseArray &BaseArray);
		%feature("autodoc", "1");
		virtual		void Delete();
		%feature("autodoc", "1");
		virtual		~DBC_BaseArray();
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		Standard_Address Lock() const;
		%feature("autodoc", "1");
		void Unlock() const;
		%feature("autodoc", "1");
		virtual		void ShallowDump(Standard_OStream & S) const;
		%feature("autodoc", "1");
		Standard_Integer _CSFDB_GetDBC_BaseArraymySize() const;
		%feature("autodoc", "1");
		void _CSFDB_SetDBC_BaseArraymySize(const Standard_Integer p);
		%feature("autodoc", "1");
		DBC_DBVArray _CSFDB_GetDBC_BaseArraymyData() const;
		%feature("autodoc", "1");
		void _CSFDB_SetDBC_BaseArraymyData(const DBC_DBVArray p);

};

%nodefaultctor DBC_VArrayTNodeOfVArrayOfExtCharacter;
class DBC_VArrayTNodeOfVArrayOfExtCharacter {
	public:
		%feature("autodoc", "1");
		~DBC_VArrayTNodeOfVArrayOfExtCharacter();
		%feature("autodoc", "1");
		DBC_VArrayTNodeOfVArrayOfExtCharacter();
		%feature("autodoc", "1");
		DBC_VArrayTNodeOfVArrayOfExtCharacter(const Standard_ExtCharacter &aValue);
		%feature("autodoc", "1");
		void SetValue(const Standard_ExtCharacter &aValue);
		%feature("autodoc", "1");
		Standard_Address Value() const;

};

%nodefaultctor DBC_VArrayOfReal;
class DBC_VArrayOfReal : public DBC_BaseArray {
	public:
		%feature("autodoc", "1");
		DBC_VArrayOfReal();
		%feature("autodoc", "1");
		DBC_VArrayOfReal(const Standard_Integer Size);
		%feature("autodoc", "1");
		DBC_VArrayOfReal(const DBC_VArrayOfReal &Varray);
		%feature("autodoc", "1");
		void Resize(const Standard_Integer Size);
		%feature("autodoc", "1");
		void Assign(const DBC_VArrayOfReal &Other);
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Standard_Real &Value);
		%feature("autodoc", "1");
		Standard_Real & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Standard_Real & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		virtual		~DBC_VArrayOfReal();

};

%nodefaultctor DBC_VArrayOfCharacter;
class DBC_VArrayOfCharacter : public DBC_BaseArray {
	public:
		%feature("autodoc", "1");
		DBC_VArrayOfCharacter();
		%feature("autodoc", "1");
		DBC_VArrayOfCharacter(const Standard_Integer Size);
		%feature("autodoc", "1");
		DBC_VArrayOfCharacter(const DBC_VArrayOfCharacter &Varray);
		%feature("autodoc", "1");
		void Resize(const Standard_Integer Size);
		%feature("autodoc", "1");
		void Assign(const DBC_VArrayOfCharacter &Other);
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Standard_Character &Value);
		%feature("autodoc", "1");
		Standard_Character & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Standard_Character & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		virtual		~DBC_VArrayOfCharacter();

};

%nodefaultctor DBC_VArrayNodeOfVArrayOfCharacter;
class DBC_VArrayNodeOfVArrayOfCharacter : public PStandard_ArrayNode {
	public:
		%feature("autodoc", "1");
		DBC_VArrayNodeOfVArrayOfCharacter();
		%feature("autodoc", "1");
		DBC_VArrayNodeOfVArrayOfCharacter(const Standard_Character &aValue);
		%feature("autodoc", "1");
		void SetValue(const Standard_Character &aValue);
		%feature("autodoc", "1");
		Standard_Address Value() const;
		%feature("autodoc", "1");
		DBC_VArrayNodeOfVArrayOfCharacter(const Storage_stCONSTclCOM &a);
		%feature("autodoc", "1");
		Standard_Character _CSFDB_GetDBC_VArrayNodeOfVArrayOfCharactermyValue() const;
		%feature("autodoc", "1");
		void _CSFDB_SetDBC_VArrayNodeOfVArrayOfCharactermyValue(const Standard_Character p);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~DBC_VArrayNodeOfVArrayOfCharacter();

};
%extend DBC_VArrayNodeOfVArrayOfCharacter {
	Handle_DBC_VArrayNodeOfVArrayOfCharacter GetHandle() {
	return *(Handle_DBC_VArrayNodeOfVArrayOfCharacter*) &$self;
	}
};

%nodefaultctor DBC_VArrayOfInteger;
class DBC_VArrayOfInteger : public DBC_BaseArray {
	public:
		%feature("autodoc", "1");
		DBC_VArrayOfInteger();
		%feature("autodoc", "1");
		DBC_VArrayOfInteger(const Standard_Integer Size);
		%feature("autodoc", "1");
		DBC_VArrayOfInteger(const DBC_VArrayOfInteger &Varray);
		%feature("autodoc", "1");
		void Resize(const Standard_Integer Size);
		%feature("autodoc", "1");
		void Assign(const DBC_VArrayOfInteger &Other);
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Standard_Integer &Value);
		%feature("autodoc", "1");
		Standard_Integer & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Standard_Integer & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		virtual		~DBC_VArrayOfInteger();

};

%nodefaultctor DBC_VArrayNodeOfVArrayOfReal;
class DBC_VArrayNodeOfVArrayOfReal : public PStandard_ArrayNode {
	public:
		%feature("autodoc", "1");
		DBC_VArrayNodeOfVArrayOfReal();
		%feature("autodoc", "1");
		DBC_VArrayNodeOfVArrayOfReal(const Standard_Real &aValue);
		%feature("autodoc", "1");
		void SetValue(const Standard_Real &aValue);
		%feature("autodoc", "1");
		Standard_Address Value() const;
		%feature("autodoc", "1");
		DBC_VArrayNodeOfVArrayOfReal(const Storage_stCONSTclCOM &a);
		%feature("autodoc", "1");
		Standard_Real _CSFDB_GetDBC_VArrayNodeOfVArrayOfRealmyValue() const;
		%feature("autodoc", "1");
		void _CSFDB_SetDBC_VArrayNodeOfVArrayOfRealmyValue(const Standard_Real p);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~DBC_VArrayNodeOfVArrayOfReal();

};
%extend DBC_VArrayNodeOfVArrayOfReal {
	Handle_DBC_VArrayNodeOfVArrayOfReal GetHandle() {
	return *(Handle_DBC_VArrayNodeOfVArrayOfReal*) &$self;
	}
};

%nodefaultctor DBC_VArrayTNodeOfVArrayOfReal;
class DBC_VArrayTNodeOfVArrayOfReal {
	public:
		%feature("autodoc", "1");
		~DBC_VArrayTNodeOfVArrayOfReal();
		%feature("autodoc", "1");
		DBC_VArrayTNodeOfVArrayOfReal();
		%feature("autodoc", "1");
		DBC_VArrayTNodeOfVArrayOfReal(const Standard_Real &aValue);
		%feature("autodoc", "1");
		void SetValue(const Standard_Real &aValue);
		%feature("autodoc", "1");
		Standard_Address Value() const;

};

%nodefaultctor DBC_VArrayOfExtCharacter;
class DBC_VArrayOfExtCharacter : public DBC_BaseArray {
	public:
		%feature("autodoc", "1");
		DBC_VArrayOfExtCharacter();
		%feature("autodoc", "1");
		DBC_VArrayOfExtCharacter(const Standard_Integer Size);
		%feature("autodoc", "1");
		DBC_VArrayOfExtCharacter(const DBC_VArrayOfExtCharacter &Varray);
		%feature("autodoc", "1");
		void Resize(const Standard_Integer Size);
		%feature("autodoc", "1");
		void Assign(const DBC_VArrayOfExtCharacter &Other);
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Standard_ExtCharacter &Value);
		%feature("autodoc", "1");
		Standard_ExtCharacter & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Standard_ExtCharacter & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		virtual		~DBC_VArrayOfExtCharacter();

};

%nodefaultctor DBC_VArrayNodeOfVArrayOfInteger;
class DBC_VArrayNodeOfVArrayOfInteger : public PStandard_ArrayNode {
	public:
		%feature("autodoc", "1");
		DBC_VArrayNodeOfVArrayOfInteger();
		%feature("autodoc", "1");
		DBC_VArrayNodeOfVArrayOfInteger(const Standard_Integer &aValue);
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer &aValue);
		%feature("autodoc", "1");
		Standard_Address Value() const;
		%feature("autodoc", "1");
		DBC_VArrayNodeOfVArrayOfInteger(const Storage_stCONSTclCOM &a);
		%feature("autodoc", "1");
		Standard_Integer _CSFDB_GetDBC_VArrayNodeOfVArrayOfIntegermyValue() const;
		%feature("autodoc", "1");
		void _CSFDB_SetDBC_VArrayNodeOfVArrayOfIntegermyValue(const Standard_Integer p);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~DBC_VArrayNodeOfVArrayOfInteger();

};
%extend DBC_VArrayNodeOfVArrayOfInteger {
	Handle_DBC_VArrayNodeOfVArrayOfInteger GetHandle() {
	return *(Handle_DBC_VArrayNodeOfVArrayOfInteger*) &$self;
	}
};