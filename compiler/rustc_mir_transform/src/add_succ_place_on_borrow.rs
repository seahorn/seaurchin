//use rustc_data_structures::flat_map_in_place::FlatMapInPlace;
//use rustc_hir::LangItem;
//use rustc_index::bit_set::{BitSet, GrowableBitSet};
//use rustc_index::IndexVec;
//use rustc_middle::bug;
//use rustc_middle::mir::patch::MirPatch;
//use rustc_middle::mir::visit::*;
use rustc_middle::mir::*;
use rustc_middle::ty::{/*self, Ty, */TyCtxt};
//use rustc_mir_dataflow::value_analysis::{excluded_locals, iter_fields};
//use rustc_target::abi::{FieldIdx, FIRST_VARIANT};

pub struct AddSuccPlaceOnBorrow;

impl<'tcx> MirPass<'tcx> for AddSuccPlaceOnBorrow {
    fn is_enabled(&self, _sess: &rustc_session::Session) -> bool {
        true
    }

    #[instrument(level = "debug", skip(self, _tcx, body))]
    fn run_pass(&self, _tcx: TyCtxt<'tcx>, body: &mut Body<'tcx>) {
        debug!(def_id = ?body.source.def_id());
        
        // 1. visitMutBorrow
        // 2. Create a map from output of op to fresh local (suc)
        // 3. Replace each use of lending ptr after borrow op with suc
        // 5. Add new stmt "suc = mk_succ_place(lending)"
    }
}
