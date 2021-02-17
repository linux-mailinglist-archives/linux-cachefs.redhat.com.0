Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 41B2B31E2D1
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Feb 2021 23:52:57 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-XA8u4rU3MpydWGUc1mJENw-1; Wed, 17 Feb 2021 17:52:54 -0500
X-MC-Unique: XA8u4rU3MpydWGUc1mJENw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E01651934102;
	Wed, 17 Feb 2021 22:52:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5435B5D9C2;
	Wed, 17 Feb 2021 22:52:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F1BB1809C91;
	Wed, 17 Feb 2021 22:52:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11HMo9iD015292 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 17 Feb 2021 17:50:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2387E2038709; Wed, 17 Feb 2021 22:50:09 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E6AF2026D46
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 22:50:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C061B8919B8
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 22:50:06 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-496-GAEFiqiyNE63cuNPalvnxg-1; Wed, 17 Feb 2021 17:50:04 -0500
X-MC-Unique: GAEFiqiyNE63cuNPalvnxg-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lCVdG-000xt5-Iq; Wed, 17 Feb 2021 22:49:44 +0000
Date: Wed, 17 Feb 2021 22:49:18 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210217224918.GP2858050@casper.infradead.org>
References: <20210217161358.GM2858050@casper.infradead.org>
	<161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
	<161340389201.1303470.14353807284546854878.stgit@warthog.procyon.org.uk>
	<1901187.1613601279@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <1901187.1613601279@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Steve French <sfrench@samba.org>, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Mike Marshall <hubcap@omnibond.com>
Subject: Re: [Linux-cachefs] [PATCH 03/33] mm: Implement readahead_control
	pageset expansion
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 17, 2021 at 10:34:39PM +0000, David Howells wrote:
> Matthew Wilcox <willy@infradead.org> wrote:
> 
> > We're defeating the ondemand_readahead() algorithm here.  Let's suppose
> > userspace is doing 64kB reads, the filesystem is OrangeFS which only
> > wants to do 4MB reads, the page cache is initially empty and there's
> > only one thread doing a sequential read.  ondemand_readahead() calls
> > get_init_ra_size() which tells it to allocate 128kB and set the async
> > marker at 64kB.  Then orangefs calls readahead_expand() to allocate the
> > remainder of the 4MB.  After the app has read the first 64kB, it comes
> > back to read the next 64kB, sees the readahead marker and tries to trigger
> > the next batch of readahead, but it's already present, so it does nothing
> > (see page_cache_ra_unbounded() for what happens with pages present).
> 
> It sounds like Christoph is right on the right track and the vm needs to ask
> the filesystem (and by extension, the cache) before doing the allocation and
> before setting the trigger flag.  Then we don't need to call back into the vm
> to expand the readahead.

Doesn't work.  You could read my reply to Christoph, or try to figure out
how to get rid of
https://evilpiepirate.org/git/bcachefs.git/tree/fs/bcachefs/fs-io.c#n742
for yourself.

> Also, there's Steve's request to try and keep at least two requests in flight
> for CIFS/SMB at the same time to consider.

That's not relevant to this problem.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

