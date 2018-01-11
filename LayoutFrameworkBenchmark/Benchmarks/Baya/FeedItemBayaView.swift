import UIKit
import Baya

class FeedItemBayaView: UIView, DataBinder {
    private var layout: BayaLayout?
    
    let actionLabel: UILabel = {
        let l = UILabel()
        l.font = UILabel().font ?? UIFont.systemFont(ofSize: 17)
        return l
    }()
    
    let optionsLabel: UILabel = {
        let l = UILabel()
        l.font = UILabel().font ?? UIFont.systemFont(ofSize: 17)
        l.text = "..."
        l.sizeToFit()
        return l
    }()
    
    let posterImageView: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "50x50.png")
        i.backgroundColor = UIColor.orange
        i.contentMode = .center
        i.sizeToFit()
        return i
    }()
    
    let posterNameLabel: UILabel = {
        let l = UILabel()
        l.backgroundColor = UIColor.yellow
        return l
    }()
    
    let posterHeadlineLabel: UILabel = {
        let l = UILabel()
        l.backgroundColor = UIColor.yellow
        l.numberOfLines = 3
        return l
    }()
    
    let posterTimeLabel: UILabel  = {
        let l = UILabel()
        l.backgroundColor = UIColor.yellow
        return l
    }()
    
    let posterCommentLabel: UILabel = UILabel()
    
    let contentImageView: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "350x200.png")
        i.contentMode = .scaleToFill
        i.sizeToFit()
        return i
    }()
    
    let contentTitleLabel: UILabel = UILabel()
    let contentDomainLabel: UILabel = UILabel()
    
    let likeLabel: UILabel = {
        let l = UILabel()
        l.backgroundColor = .green
        l.text = "Like"
        l.sizeToFit()
        return l
    }()
    
    let commentLabel: UILabel = {
        let l = UILabel()
        l.text = "Comment"
        l.backgroundColor = .green
        l.textAlignment = .center
        l.sizeToFit()
        return l
    }()
    
    let shareLabel: UILabel = {
        let l = UILabel()
        l.text = "Share"
        l.backgroundColor = .green
        l.textAlignment = .right
        l.sizeToFit()
        return l
    }()
    
    let actorImageView: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "50x50.png")
        i.sizeToFit()
        return i
    }()
    
    let actorCommentLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(actionLabel)
        addSubview(optionsLabel)
        addSubview(posterImageView)
        addSubview(posterNameLabel)
        addSubview(posterHeadlineLabel)
        addSubview(posterTimeLabel)
        addSubview(posterCommentLabel)
        addSubview(contentImageView)
        addSubview(contentTitleLabel)
        addSubview(contentDomainLabel)
        addSubview(likeLabel)
        addSubview(commentLabel)
        addSubview(shareLabel)
        addSubview(actorImageView)
        addSubview(actorCommentLabel)
        backgroundColor = UIColor.white
        
        createLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(_ data: FeedItemData) {
        actionLabel.text = data.actionText
        
        posterNameLabel.text = data.posterName
        posterHeadlineLabel.text = data.posterHeadline
        posterTimeLabel.text = data.posterTimestamp
        
        posterCommentLabel.text = data.posterComment
        contentTitleLabel.text = data.contentTitle
        contentDomainLabel.text = data.contentDomain
        actorCommentLabel.text = data.actorComment
        
        setNeedsLayout()
    }
    
    func createLayout() {
        let actionBar = [
            actionLabel,
            optionsLabel.layoutGravitating(to: .right)]
            .layoutAsFrame()
            .layoutMatchingParentWidth()

        let posterDetails = [
            posterNameLabel,
            posterHeadlineLabel,
            posterTimeLabel]
            .layoutLinearly(orientation: .vertical, spacing: 5)
        let posterCard = [
            posterImageView
                .layoutGravitating(to: .centerY),
            posterDetails]
            .layoutLinearly(orientation: .horizontal)

        let ctaBar = [
            likeLabel,
            commentLabel
                .layoutGravitating(to: .centerX),
            shareLabel
                .layoutGravitating(to: .right)]
            .layoutAsFrame()
            .layoutMatchingParentWidth()

        let actorBar = [
            actorImageView,
            actorCommentLabel]
            .layoutLinearly(orientation: .vertical)

        layout = [
            actionBar,
            posterCard,
            posterCommentLabel,
            contentImageView
                .layoutMatchingParentWidth(),
            contentTitleLabel,
            contentDomainLabel,
            ctaBar,
            actorBar]
            .layoutLinearly(orientation: .vertical, bayaMargins: UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8))
            .layoutMatchingParentWidth()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return layout?.startMeasure(with: size) ?? .zero
    }
    
    override func layoutSubviews() {
        layout?.startLayout(with: bounds)
    }
}


