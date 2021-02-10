
import UIKit

extension UITableView {
    func visibleIndexPathsIncludingPartials(_ partial: Bool, additionalBottomSpace: CGFloat = 0) -> [IndexPath] {
        guard let result = self.indexPathsForVisibleRows else { return []}
        if partial {
            return result
        }
        
        var mutableResult: [IndexPath] = []
        for indexPath in result {
            let cellRect = rectForRow(at: indexPath)
            if !cellRect.isEmpty {
                let rectInTableView = convert(cellRect, to: superview)
                if rectInTableView.origin.y < 0.0 {
                    continue
                }
                let superViewMaxY: CGFloat = bounds.maxY - additionalBottomSpace
                if rectInTableView.maxY > superViewMaxY {
                    continue
                }
            } else {
                continue
            }
            mutableResult.append(indexPath)
        }
        
        return mutableResult
    }
}
