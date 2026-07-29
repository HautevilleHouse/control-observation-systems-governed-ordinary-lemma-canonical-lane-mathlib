import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean

structure ControlObservationSystem where
  stateSpace : Type u
  observationSpace : Type v
  controlSpace : Type w
  dynamics : stateSpace → controlSpace → stateSpace
  observationMap : stateSpace → observationSpace
  initialCondition : stateSpace
  governedLaw : Prop
  governedLawTerm : governedLaw

structure AdmissibleControl (S : ControlObservationSystem) where
  policy : S.stateSpace → S.controlSpace
  admissibilityCondition : Prop
  admissibilityConditionTerm : admissibilityCondition

def systemTrajectory (S : ControlObservationSystem) (c : AdmissibleControl S) : ℕ → S.stateSpace := by
  intro n
  induction' n with k x
  · exact S.initialCondition
  · exact S.dynamics x (c.policy x)

theorem governed_ordinary_lemma (S : ControlObservationSystem) (c : AdmissibleControl S) :
    S.governedLaw := S.governedLawTerm

end ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean
end HautevilleHouse