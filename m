Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 11C372F659C
	for <lists+linux-cachefs@lfdr.de>; Thu, 14 Jan 2021 17:20:21 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-2czzEbRTMYy7uJQ5FoQgBQ-1; Thu, 14 Jan 2021 11:20:18 -0500
X-MC-Unique: 2czzEbRTMYy7uJQ5FoQgBQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 552D0100C660;
	Thu, 14 Jan 2021 16:20:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D85DD10016F7;
	Thu, 14 Jan 2021 16:20:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FC78180954D;
	Thu, 14 Jan 2021 16:20:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10EGK8nm005752 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 14 Jan 2021 11:20:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DE5A72166B2E; Thu, 14 Jan 2021 16:20:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D99662166B2D
	for <linux-cachefs@redhat.com>; Thu, 14 Jan 2021 16:20:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CBC5100B16F
	for <linux-cachefs@redhat.com>; Thu, 14 Jan 2021 16:20:05 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-162-M0QVP75bPDWb3YwiUa4L8A-1; Thu, 14 Jan 2021 11:20:03 -0500
X-MC-Unique: M0QVP75bPDWb3YwiUa4L8A-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1l05LN-007mRF-WF; Thu, 14 Jan 2021 16:19:41 +0000
Date: Thu, 14 Jan 2021 16:19:29 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210114161929.GQ35215@casper.infradead.org>
References: <2758811.1610621106@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <2758811.1610621106@warthog.procyon.org.uk>
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	dchinner@redhat.com, linux-kernel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Dominique Martinet <asmadeus@codewreck.org>
Subject: Re: [Linux-cachefs] Redesigning and modernising fscache
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 14, 2021 at 10:45:06AM +0000, David Howells wrote:
> However, there've been some objections to the approach I've taken to
> implementing this.  The way I've done it is to disable the use of fscache by
> the five network filesystems that use it, remove much of the old code, put in
> the reimplementation, then cut the filesystems over.  I.e. rip-and-replace.
> It leaves unported filesystems unable to use it - but three of the five are
> done (afs, ceph, nfs), and I've supplied partially-done patches for the other
> two (9p, cifs).
> 
> It's been suggested that it's too hard to review this way and that either I
> should go for a gradual phasing in or build the new one in parallel.  The
> first is difficult because I want to change how almost everything in there
> works - but the parts are tied together; the second is difficult because there
> are areas that would *have* to overlap (the UAPI device file, the cache
> storage, the cache size limits and at least some state for managing these), so
> there would have to be interaction between the two variants.  One refinement
> of the latter would be to make the two implementations mutually exclusive: you
> can build one or the other, but not both.

My reservation with "build fscache2" is that it's going to take some
time to do, and I really want rid of ->readpages as soon as possible.

What I'd like to see is netfs_readahead() existing as soon as possible,
built on top of the current core.  Then filesystems can implement
netfs_read_request_ops one by one, and they become insulated from the
transition.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

