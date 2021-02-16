Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 646AE31C8D7
	for <lists+linux-cachefs@lfdr.de>; Tue, 16 Feb 2021 11:32:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-lvvNQyViNuaXGCrjuA662w-1; Tue, 16 Feb 2021 05:32:38 -0500
X-MC-Unique: lvvNQyViNuaXGCrjuA662w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C0E08030C2;
	Tue, 16 Feb 2021 10:32:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E73CF16E47;
	Tue, 16 Feb 2021 10:32:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DBD3118095CB;
	Tue, 16 Feb 2021 10:32:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11GAWUku019891 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 05:32:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EB32420CA487; Tue, 16 Feb 2021 10:32:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5F7220CA486
	for <linux-cachefs@redhat.com>; Tue, 16 Feb 2021 10:32:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB69D845D9B
	for <linux-cachefs@redhat.com>; Tue, 16 Feb 2021 10:32:26 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-278-YE1XG20SMR2-2Bbv2UmqFA-1;
	Tue, 16 Feb 2021 05:32:22 -0500
X-MC-Unique: YE1XG20SMR2-2Bbv2UmqFA-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3E1E76736F; Tue, 16 Feb 2021 11:32:16 +0100 (CET)
Date: Tue, 16 Feb 2021 11:32:15 +0100
From: Christoph Hellwig <hch@lst.de>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210216103215.GB27714@lst.de>
References: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
	<161340389201.1303470.14353807284546854878.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <161340389201.1303470.14353807284546854878.stgit@warthog.procyon.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
	linux-afs@lists.infradead.org, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Christoph Hellwig <hch@lst.de>, Steve French <sfrench@samba.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 03/33] mm: Implement readahead_control
	pageset expansion
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 15, 2021 at 03:44:52PM +0000, David Howells wrote:
> Provide a function, readahead_expand(), that expands the set of pages
> specified by a readahead_control object to encompass a revised area with a
> proposed size and length.
> 
> The proposed area must include all of the old area and may be expanded yet
> more by this function so that the edges align on (transparent huge) page
> boundaries as allocated.
> 
> The expansion will be cut short if a page already exists in either of the
> areas being expanded into.  Note that any expansion made in such a case is
> not rolled back.
> 
> This will be used by fscache so that reads can be expanded to cache granule
> boundaries, thereby allowing whole granules to be stored in the cache, but
> there are other potential users also.

So looking at linux-next this seems to have a user, but that user is
dead wood given that nothing implements ->expand_readahead.

Looking at the code structure I think netfs_readahead and
netfs_rreq_expand is a complete mess and needs to be turned upside
down, that is instead of calling back from netfs_readahead to the
calling file system, split it into a few helpers called by the
caller.

But even after this can't we just expose the cache granule boundary
to the VM so that the read-ahead request gets setup correctly from
the very beginning?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

