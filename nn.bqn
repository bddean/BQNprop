# Utilities and hyperparameters.
learning_rate ← 0.5
MxV ← +˝∘×⎉1‿∞ # Matrix × Vector multiplication via BQNCrate
Sigmoid ← {÷1+⋆-𝕩}
random ← •MakeRand 18210
InitWeight ← { 𝕤⋄ ¯1 + 0.01 × random.Range 200 }

# 𝕩 is a list of layer sizes; output is a list of weights
Create ⇐ {
	sh←¯1↓(⊢ ≍˘ «) 𝕩
	{<>InitWeight˘¨ 𝕩⥊↕0}˘sh
}

# Run a trained network; pass input 𝕨 through weights 𝕩.
Compute ⇐ Sigmoid∘MxV˜´⟜⌽

# BackProp performs the backpropagation algorithm to return an incrementally
# improved set of weights 𝕩.
# 
# Glossary:
#   z :: weighted node output at each row
#   a :: activation values (`Sigmoid z`)
#   e :: activation error (δ in http://neuralnetworksanddeeplearning.com/chap2.htmlreference)
#   𝕩 :: model (weights matrix-list)
#   d𝕨d𝕩 :: derivative of some value 𝕨 w.r.t some 𝕩
BackProp ⇐ {
	⟨input, target⟩ ← 𝕨
	a←(<input) Sigmoid∘MxV` 𝕩
	# Conveniently, sigmoid's derivative `dzda` can be expressed in terms of
	# its output `a`.
	dzda ← ×⟜¬¨ a
	eL←(¯1⊑dzda) × 2 × (¯1⊑a) - target
	# Now *propagate* error from (o)utput *back* to (i)nput.
	e ← { eo ← 𝕨 ⋄ wo‿d ← 𝕩
		d × wo MxV eo
	}`⌾⌽ ⟨eL⟩ ∾⎉∞˜ <˘ 1↓𝕩≍˘»dzda
	𝕩 - learning_rate × (¯1↓⟨input⟩∾a) ×⌜¨ e
}

Test ⇐ {⋄⋄⋄ 𝕤 ⋄⋄⋄
	i←0.7‿0.8‿0.9
	m←Create 3‿4‿4‿4‿4‿4‿5‿4‿3
	exp←1‿0.5‿0.1
	•Show "		~~ EXPECT:"
	•Show exp
	•Show "		~~ COMPUTE - first:"
	•Show i Compute m
	m↩ { input ⇐i, target ⇐ exp } BackProp⍟75 m
	•Show "		~~ COMPUTE - trained:"
	•Show i Compute m
}
