Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id BEAC82CE249
	for <lists+linux-cachefs@lfdr.de>; Fri,  4 Dec 2020 00:06:02 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-Cf-5gt8ANEWnaqppmUhQ0g-1; Thu, 03 Dec 2020 18:06:00 -0500
X-MC-Unique: Cf-5gt8ANEWnaqppmUhQ0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8F4D107ACE6;
	Thu,  3 Dec 2020 23:05:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 895E160854;
	Thu,  3 Dec 2020 23:05:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1EF39180954D;
	Thu,  3 Dec 2020 23:05:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3N5rve014657 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 18:05:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D86CC2166B27; Thu,  3 Dec 2020 23:05:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D18912166B2B
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 23:05:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69A09811E76
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 23:05:51 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-7-TmqXZTbSMPWH8vqggSb8kg-1; Thu, 03 Dec 2020 18:05:47 -0500
X-MC-Unique: TmqXZTbSMPWH8vqggSb8kg-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1kkxfR-0005ae-Qa; Thu, 03 Dec 2020 23:05:41 +0000
Date: Thu, 3 Dec 2020 23:05:41 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20201203230541.GL11935@casper.infradead.org>
References: <914680.1607004656@warthog.procyon.org.uk>
	<20201203221202.GA4170059@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20201203221202.GA4170059@dread.disaster.area>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>, Yafang Shao <laoar.shao@gmail.com>,
	linux-cachefs@redhat.com, dchinner@redhat.com,
	linux-fsdevel@vger.kernel.org
Subject: Re: [Linux-cachefs] Problems doing DIO to netfs cache on XFS from
	Ceph
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
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

Might be a good idea to cc Yafang on this ...

On Fri, Dec 04, 2020 at 09:12:02AM +1100, Dave Chinner wrote:
> On Thu, Dec 03, 2020 at 02:10:56PM +0000, David Howells wrote:
> > Hi Christoph,
> > 
> > We're having a problem making the fscache/cachefiles rewrite work with XFS, if
> > you could have a look?  Jeff Layton just tripped the attached warning from
> > this:
> > 
> > 	/*
> > 	 * Given that we do not allow direct reclaim to call us, we should
> > 	 * never be called in a recursive filesystem reclaim context.
> > 	 */
> > 	if (WARN_ON_ONCE(current->flags & PF_MEMALLOC_NOFS))
> > 		goto redirty;
> 
> I've pointed out in other threads where issues like this have been
> raised that this check is not correct and was broken some time ago
> by the PF_FSTRANS removal. The "NOFS" case here was originally using
> PF_FSTRANS to protect against recursion from within transaction
> contexts, not recursion through memory reclaim.  Doing writeback
> from memory reclaim is caught by the preceeding PF_MEMALLOC check,
> not this one.
> 
> What it is supposed to be warning about is that writeback in XFS can
> start new transactions and nesting transactions is a guaranteed way
> to deadlock the journal. IOWs, doing writeback from an active
> transaction context is a bug in XFS.
> 
> IOWs, we are waiting on a new version of this patchset to be posted:
> 
> https://lore.kernel.org/linux-xfs/20201103131754.94949-1-laoar.shao@gmail.com/
> 
> so that we can get rid of this from iomap and check the transaction
> recursion case directly in the XFS code. Then your problem goes away
> completely....
> 
> Cheers,
> 
> Dave.
> -- 
> Dave Chinner
> david@fromorbit.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

