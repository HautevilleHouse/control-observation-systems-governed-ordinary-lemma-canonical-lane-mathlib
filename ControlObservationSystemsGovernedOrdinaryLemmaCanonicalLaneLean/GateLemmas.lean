import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean
end HautevilleHouse