Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 46E10390BFF
	for <lists+linux-cachefs@lfdr.de>; Wed, 26 May 2021 00:14:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-t5xyrl_YOa2ukfXiS_za8w-1; Tue, 25 May 2021 18:14:10 -0400
X-MC-Unique: t5xyrl_YOa2ukfXiS_za8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD1261005D53;
	Tue, 25 May 2021 22:14:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BB40687DF;
	Tue, 25 May 2021 22:14:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B73D81801029;
	Tue, 25 May 2021 22:14:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14PME2Mw006657 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 25 May 2021 18:14:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1DEBF11360FD; Tue, 25 May 2021 22:14:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1953B114B2EE
	for <linux-cachefs@redhat.com>; Tue, 25 May 2021 22:13:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86FBA1857F2B
	for <linux-cachefs@redhat.com>; Tue, 25 May 2021 22:13:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-158-AsCeiDaxNkmamlXjQCMU8g-1;
	Tue, 25 May 2021 18:13:53 -0400
X-MC-Unique: AsCeiDaxNkmamlXjQCMU8g-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id F38A761019;
	Tue, 25 May 2021 22:13:51 +0000 (UTC)
Date: Tue, 25 May 2021 15:13:51 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20210525221351.GB202068@locust>
References: <206078.1621264018@warthog.procyon.org.uk>
	<6E4DE257-4220-4B5B-B3D0-B67C7BC69BB5@dilger.ca>
	<YKntRtEUoxTEFBOM@localhost>
	<B70B57ED-6F11-45CC-B99F-86BBDE36ACA4@dilger.ca>
	<YK1rebI5vZKCeLlp@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <YK1rebI5vZKCeLlp@casper.infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: Andreas Dilger <adilger@dilger.ca>, xfs <linux-xfs@vger.kernel.org>,
	Theodore Ts'o <tytso@mit.edu>, Josh Triplett <josh@joshtriplett.org>,
	NeilBrown <neilb@suse.com>, Chris Mason <clm@fb.com>,
	linux-cachefs@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>
Subject: Re: [Linux-cachefs] How capacious and well-indexed are ext4,
 xfs and btrfs directories?
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 25, 2021 at 10:26:17PM +0100, Matthew Wilcox wrote:
> On Tue, May 25, 2021 at 03:13:52PM -0600, Andreas Dilger wrote:
> > Definitely "-o discard" is known to have a measurable performance impact,
> > simply because it ends up sending a lot more requests to the block device,
> > and those requests can be slow/block the queue, depending on underlying
> > storage behavior.
> > 
> > There was a patch pushed recently that targets "-o discard" performance:
> > https://patchwork.ozlabs.org/project/linux-ext4/list/?series=244091
> > that needs a bit more work, but may be worthwhile to test if it improves
> > your workload, and help put some weight behind landing it?
> 
> This all seems very complicated.  I have chosen with my current laptop
> to "short stroke" the drive.  That is, I discarded the entire bdev,
> then partitioned it roughly in half.  The second half has never seen
> any writes.  This effectively achieves the purpose of TRIM/discard;
> there are a lot of unused LBAs, so the underlying flash translation layer
> always has plenty of spare space when it needs to empty an erase block.
> 
> Since the steady state of hard drives is full, I have to type 'make clean'
> in my build trees more often than otherwise and remember to delete iso
> images after i've had them lying around for a year, but I'd rather clean
> up a little more often than get these weird performance glitches.
> 
> And if I really do need half a terabyte of space temporarily, I can
> always choose to use the fallow range for a while, then discard it again.

I just let xfs_scrub run FITRIM on Sundays at 4:30am. ;)

--D

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

