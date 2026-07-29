import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean

structure SeparationPrinciplePackage (O : ControlObservationSystem) (OG : SystemModelPackage) where
  observer : ObservationOperatorPackage O
  controller : FeedbackGain O
  separationHolds : Prop
  observerClosed : ObservationOperatorClosed observer
  controllerClosed : FeedbackGainClosed controller
  separationHoldsClosed : separationHolds

def SeparationPrincipleClosed {O : ControlObservationSystem} {OG : SystemModelPackage} (S : SeparationPrinciplePackage O OG) : Prop :=
  S.observerClosed ∧ S.controllerClosed ∧ S.separationHolds

structure SeparationPrincipleEvidence {O : ControlObservationSystem} {OG : SystemModelPackage} (S : SeparationPrinciplePackage O OG) where
  observerClosed : S.observerClosed
  controllerClosed : S.controllerClosed
  separationHoldsClosed : S.separationHolds

theorem separation_principle_closed_from_evidence {O : ControlObservationSystem} {OG : SystemModelPackage} (S : SeparationPrinciplePackage O OG) (E : SeparationPrincipleEvidence S) : SeparationPrincipleClosed S := by
  exact And.intro E.observerClosed (And.intro E.controllerClosed E.separationHoldsClosed)

end ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean
end HautevilleHouse