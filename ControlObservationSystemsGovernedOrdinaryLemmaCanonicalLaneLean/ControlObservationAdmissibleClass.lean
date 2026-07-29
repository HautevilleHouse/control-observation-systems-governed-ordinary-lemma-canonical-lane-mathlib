import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean

structure ControlObservationAdmittedObject where
  stateSpace : Type
  controlSet : Type
  observationSet : Type
  dynamics : stateSpace → controlSet → stateSpace
  observationMap : stateSpace → observationSet
  conclusion : Prop

structure AdmissibleClass where
  object : ControlObservationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ControlObservationWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def ControlObservationWitnessClosed (O : ControlObservationAdmittedObject) : Prop :=
  O.conclusion

end ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean
end HautevilleHouse