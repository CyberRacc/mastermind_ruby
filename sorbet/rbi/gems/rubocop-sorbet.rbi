# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict

#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/rubocop-sorbet/all/rubocop-sorbet.rbi
#
# rubocop-sorbet-0.7.7

module RuboCop
end

module RuboCop::Sorbet
end

class RuboCop::Sorbet::Error < StandardError
end

module RuboCop::Sorbet::Inject
  def self.defaults!; end
end

module RuboCop::Cop
end

module RuboCop::Cop::Sorbet
end

module RuboCop::Cop::Sorbet::TargetSorbetVersion
  def enabled_for_sorbet_static_version?; end
  def read_sorbet_static_version_from_bundler_lock_file; end
  def self.included(target); end
  def sorbet_enabled?; end
  def target_sorbet_static_version_from_bundler_lock_file; end
end

module RuboCop::Cop::Sorbet::TargetSorbetVersion::ClassMethods
  def minimum_target_sorbet_static_version(version); end
  def supports_target_sorbet_static_version?(version); end
end

module RuboCop::Cop::Sorbet::SignatureHelp
  def on_block(node); end
  def on_numblock(node); end
  def on_signature(_node); end
  def signature?(param0 = nil); end
  def with_runtime?(param0 = nil); end
  def without_runtime?(param0 = nil); end
  extend RuboCop::AST::NodePattern::Macros
end

class RuboCop::Cop::Sorbet::BindingConstantWithoutTypeAlias < RuboCop::Cop::Base
  def on_casgn(node); end
  def requires_type_alias?(param0 = nil); end
  def send_leaf(node); end
  def type_alias_with_block?(param0 = nil); end
  def type_alias_without_block(param0 = nil); end
  extend RuboCop::Cop::AutoCorrector
end

class RuboCop::Cop::Sorbet::ConstantsFromStrings < RuboCop::Cop::Cop
  def constant_from_string?(param0 = nil); end
  def on_send(node); end
end

class RuboCop::Cop::Sorbet::ForbidSuperclassConstLiteral < RuboCop::Cop::Base
  def dynamic_superclass?(param0 = nil); end
  def on_class(node); end
end

class RuboCop::Cop::Sorbet::ForbidIncludeConstLiteral < RuboCop::Cop::Base
  def dynamic_inclusion?(param0 = nil); end
  def neither_const_nor_self?(node); end
  def on_send(node); end
  def within_onymous_module?(node); end
  extend RuboCop::Cop::AutoCorrector
end

class RuboCop::Cop::Sorbet::ForbidTypeAliasedShapes < RuboCop::Cop::Base
  def on_block(node); end
  def on_numblock(node); end
  def shape_type_alias?(param0 = nil); end
end

class RuboCop::Cop::Sorbet::ForbidUntypedStructProps < RuboCop::Cop::Base
  def on_class(node); end
  def subclass_of_t_struct?(param0 = nil); end
  def t_nilable_untyped(param0 = nil); end
  def t_struct(param0 = nil); end
  def t_untyped(param0 = nil); end
  def untyped_props(param0); end
end

class RuboCop::Cop::Sorbet::ImplicitConversionMethod < RuboCop::Cop::Base
  def on_alias(node); end
  def on_def(node); end
  def on_defs(node); end
  def on_send(node); end
end

class RuboCop::Cop::Sorbet::OneAncestorPerLine < RuboCop::Cop::Cop
  def abstract?(param0); end
  def autocorrect(node); end
  def more_than_one_ancestor(param0 = nil); end
  def new_ra_line(indent_count); end
  def on_class(node); end
  def on_module(node); end
  def process_node(node); end
  def requires_ancestors(param0); end
end

class RuboCop::Cop::Sorbet::CallbackConditionalsBinding < RuboCop::Cop::Cop
  def autocorrect(node); end
  def on_send(node); end
end

class RuboCop::Cop::Sorbet::ForbidTStruct < RuboCop::Cop::Base
  def initialize_method(indent, props); end
  def on_class(node); end
  def on_send(node); end
  def previous_line_blank?(node); end
  def t_props?(param0 = nil); end
  def t_struct?(param0 = nil); end
  extend RuboCop::Cop::AutoCorrector
  include RuboCop::Cop::Alignment
  include RuboCop::Cop::CommentsHelp
  include RuboCop::Cop::RangeHelp
end

class RuboCop::Cop::Sorbet::ForbidTStruct::TStructWalker
  def extend_t_sig?(param0 = nil); end
  def has_extend_t_sig; end
  def initialize; end
  def on_send(node); end
  def props; end
  def t_struct_prop?(param0 = nil); end
  extend RuboCop::AST::NodePattern::Macros
  include RuboCop::AST::Traversal
end

class RuboCop::Cop::Sorbet::ForbidTStruct::Property
  def attr_accessor; end
  def attr_sig; end
  def default; end
  def factory; end
  def initialize(node, kind, name, type, default:, factory:); end
  def initialize_assign; end
  def initialize_param; end
  def initialize_sig_param; end
  def kind; end
  def name; end
  def nilable?; end
  def node; end
  def type; end
end

class RuboCop::Cop::Sorbet::ForbidTUnsafe < RuboCop::Cop::Base
  def on_send(node); end
  def t_unsafe?(param0 = nil); end
end

class RuboCop::Cop::Sorbet::ForbidTUntyped < RuboCop::Cop::Base
  def on_send(node); end
  def t_untyped?(param0 = nil); end
end

class RuboCop::Cop::Sorbet::RedundantExtendTSig < RuboCop::Cop::Base
  def extend_t_sig?(param0 = nil); end
  def on_send(node); end
  extend RuboCop::Cop::AutoCorrector
  include RuboCop::Cop::RangeHelp
end

class RuboCop::Cop::Sorbet::TypeAliasName < RuboCop::Cop::Base
  def on_casgn(node); end
  def underscored_type_alias?(param0 = nil); end
end

class RuboCop::Cop::Sorbet::ObsoleteStrictMemoization < RuboCop::Cop::Base
  def legacy_memoization_pattern?(param0 = nil); end
  def on_begin(node); end
  def relevant_file?(file); end
  extend RuboCop::Cop::AutoCorrector
  extend RuboCop::Cop::Sorbet::TargetSorbetVersion::ClassMethods
  include RuboCop::Cop::Alignment
  include RuboCop::Cop::LineLengthHelp
  include RuboCop::Cop::MatchRange
  include RuboCop::Cop::RangeHelp
  include RuboCop::Cop::Sorbet::TargetSorbetVersion
end

class RuboCop::Cop::Sorbet::BuggyObsoleteStrictMemoization < RuboCop::Cop::Base
  def buggy_legacy_memoization_pattern?(param0 = nil); end
  def on_begin(node); end
  def relevant_file?(file); end
  extend RuboCop::Cop::AutoCorrector
  extend RuboCop::Cop::Sorbet::TargetSorbetVersion::ClassMethods
  include RuboCop::Cop::Alignment
  include RuboCop::Cop::LineLengthHelp
  include RuboCop::Cop::MatchRange
  include RuboCop::Cop::RangeHelp
  include RuboCop::Cop::Sorbet::TargetSorbetVersion
end

class RuboCop::Cop::Sorbet::ForbidExtendTSigHelpersInShims < RuboCop::Cop::Base
  def extend_t_sig_or_helpers?(param0 = nil); end
  def on_send(node); end
  extend RuboCop::Cop::AutoCorrector
  include RuboCop::Cop::RangeHelp
end

class RuboCop::Cop::Sorbet::ForbidRBIOutsideOfAllowedPaths < RuboCop::Cop::Cop
  def allowed_paths; end
  def investigate(processed_source); end
  include RuboCop::Cop::RangeHelp
end

class RuboCop::Cop::Sorbet::SingleLineRbiClassModuleDefinitions < RuboCop::Cop::Base
  def convert_newlines_to_semicolons(source); end
  def on_class(node); end
  def on_module(node); end
  extend RuboCop::Cop::AutoCorrector
end

class RuboCop::Cop::Sorbet::AllowIncompatibleOverride < RuboCop::Cop::Base
  def on_block(node); end
  def on_numblock(node); end
  def on_send(node); end
  def override?(param0 = nil); end
  def sig?(param0); end
  def sig_dot_override?(param0 = nil); end
end

class RuboCop::Cop::Sorbet::CheckedTrueInSignature < RuboCop::Cop::Cop
  def offending_node(param0); end
  def on_signature(node); end
  include RuboCop::Cop::RangeHelp
  include RuboCop::Cop::Sorbet::SignatureHelp
end

class RuboCop::Cop::Sorbet::VoidCheckedTests < RuboCop::Cop::Base
  def checked_tests(param0); end
  def on_signature(node); end
  def top_level_void(node); end
  extend RuboCop::Cop::AutoCorrector
  include RuboCop::Cop::RangeHelp
  include RuboCop::Cop::Sorbet::SignatureHelp
end

class RuboCop::Cop::Sorbet::KeywordArgumentOrdering < RuboCop::Cop::Cop
  def check_order_for_kwoptargs(parameters); end
  def on_signature(node); end
  include RuboCop::Cop::Sorbet::SignatureHelp
end

class RuboCop::Cop::Sorbet::SignatureBuildOrder < RuboCop::Cop::Cop
  def autocorrect(node); end
  def call_chain(sig_child_node); end
  def can_autocorrect?; end
  def node_reparsed_with_modern_features(node); end
  def on_signature(node); end
  def root_call(param0); end
  include RuboCop::Cop::Sorbet::SignatureHelp
end

class RuboCop::Cop::Sorbet::SignatureBuildOrder::ModernBuilder < RuboCop::AST::Builder
end

class RuboCop::Cop::Sorbet::EnforceSignatures < RuboCop::Cop::Cop
  def accessor?(param0 = nil); end
  def autocorrect(node); end
  def check_node(node); end
  def initialize(config = nil, options = nil); end
  def on_def(node); end
  def on_defs(node); end
  def on_send(node); end
  def on_signature(node); end
  def param_type_placeholder; end
  def return_type_placeholder; end
  def scope(node); end
  include RuboCop::Cop::Sorbet::SignatureHelp
end

class RuboCop::Cop::Sorbet::EnforceSignatures::SigSuggestion
  def generate_params; end
  def generate_return; end
  def initialize(indent, param_placeholder, return_placeholder); end
  def params; end
  def params=(arg0); end
  def returns; end
  def returns=(arg0); end
  def to_autocorrect; end
end

class RuboCop::Cop::Sorbet::EmptyLineAfterSig < RuboCop::Cop::Base
  def lines_between(node1, node2, buffer: nil); end
  def next_sibling(node); end
  def on_signature(sig); end
  def sig_or_signable_method_definition?(param0 = nil); end
  extend RuboCop::Cop::AutoCorrector
  include RuboCop::Cop::RangeHelp
  include RuboCop::Cop::Sorbet::SignatureHelp
end

class RuboCop::Cop::Sorbet::ValidSigil < RuboCop::Cop::Cop
  def autocorrect(_node); end
  def check_sigil_present(sigil); end
  def check_strictness_level(sigil, strictness); end
  def check_strictness_not_empty(sigil, strictness); end
  def check_strictness_valid(sigil, strictness); end
  def exact_strictness; end
  def extract_sigil(processed_source); end
  def extract_strictness(sigil); end
  def investigate(processed_source); end
  def minimum_strictness; end
  def require_sigil_on_all_files?; end
  def suggested_strictness; end
  def suggested_strictness_level; end
end

class RuboCop::Cop::Sorbet::HasSigil < RuboCop::Cop::Sorbet::ValidSigil
  def require_sigil_on_all_files?; end
end

class RuboCop::Cop::Sorbet::IgnoreSigil < RuboCop::Cop::Sorbet::HasSigil
  def minimum_strictness; end
end

class RuboCop::Cop::Sorbet::FalseSigil < RuboCop::Cop::Sorbet::HasSigil
  def minimum_strictness; end
end

class RuboCop::Cop::Sorbet::TrueSigil < RuboCop::Cop::Sorbet::HasSigil
  def minimum_strictness; end
end

class RuboCop::Cop::Sorbet::StrictSigil < RuboCop::Cop::Sorbet::HasSigil
  def minimum_strictness; end
end

class RuboCop::Cop::Sorbet::StrongSigil < RuboCop::Cop::Sorbet::HasSigil
  def minimum_strictness; end
end

class RuboCop::Cop::Sorbet::EnforceSigilOrder < RuboCop::Cop::Sorbet::ValidSigil
  def autocorrect(_node); end
  def check_magic_comments_order(tokens); end
  def extract_magic_comments(processed_source); end
  def investigate(processed_source); end
  include RuboCop::Cop::RangeHelp
end

class RuboCop::Cop::Sorbet::EnforceSingleSigil < RuboCop::Cop::Sorbet::ValidSigil
  def autocorrect(_node); end
  def extract_all_sigils(processed_source); end
  def investigate(processed_source); end
  include RuboCop::Cop::RangeHelp
end

module RuboCop::Cop::Sorbet::MutableConstantSorbetAwareBehaviour
  def on_assignment(value); end
  def self.prepended(base); end
end

class RuboCop::Cop::Style::MutableConstant < RuboCop::Cop::Base
  def t_let(param0 = nil); end
end

class Mastermind
  def guess_valid?(guess); end
  def initialize; end
  def mode_select; end
  def play_game; end
  def play_round(round); end
  def player_guess; end
end

class UserInteraction
  def create_code; end
  def guess_input; end
  def user_name; end
end

class GameBoard
  def display_board; end
  def initialize; end
  def update_board(round, colors); end
end

class Player
  def initialize(name); end
  def name; end
end

class Computer
  def generate_code(code_length); end
end
