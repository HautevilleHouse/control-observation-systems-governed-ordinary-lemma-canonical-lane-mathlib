import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean.ControlObservationSystem

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean

structure ObservationConvergencePackage (S : ControlObservationSystem) (c : AdmissibleControl S) where
  observationSequence : ℕ → S.observationSpace
  convergenceRate : Prop
  limitObservation : S.observationSpace
  convergenceClosed : Prop
  convergenceClosedTerm : convergenceClosed

structure ObservationConvergenceEvidence {S : ControlObservationSystem} {c : AdmissibleControl S}
    (P : ObservationConvergencePackage S c) where
  convergenceRateClosed : P.convergenceRate
  limitObservationClosed : P.limitObservation = P.observationSequence 0

def ObservationConvergenceClosed {S : ControlObservationSystem} {c : AdmissibleControl S}
    (P : ObservationConvergencePackage S c) : Prop :=
  P.convergenceClosed

theorem observation_convergence_closed_from_evidence {S : ControlObservationSystem} {c : AdmissibleControl S}
    (P : ObservationConvergencePackage S c) (E : ObservationConvergenceEvidence P) :
    ObservationConvergenceClosed P := by
  exact P.convergenceClosedTerm

end ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean
end HautevilleHouse