import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean.ControlObservationSystem

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean

structure AdmittedObject where
  system : ControlObservationSystem
  control : AdmissibleControl system
  objectClosed : Prop
  conclusion : objectClosed

def bridgeClosed (A : AdmissibleClass) : Prop :=
  let obj : AdmittedObject := A.object
  obj.objectClosed

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  let obj : AdmittedObject := A.object
  exact obj.conclusion

end ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean
end HautevilleHouse