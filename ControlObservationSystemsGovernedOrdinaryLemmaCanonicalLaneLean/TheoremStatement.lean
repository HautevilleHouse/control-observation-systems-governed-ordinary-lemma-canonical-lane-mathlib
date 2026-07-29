import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean

structure ControlObservationAdmittedObject where
  systemType : Type
  observationSpace : Type
  governOrdinaryLemma : Prop
  conclusion : governOrdinaryLemma

def ControlObservationWitnessClosed (O : ControlObservationAdmittedObject) : Prop :=
  O.governOrdinaryLemma

end ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean
end HautevilleHouse