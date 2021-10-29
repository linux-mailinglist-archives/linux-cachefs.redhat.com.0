Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AED443FDDB
	for <lists+linux-cachefs@lfdr.de>; Fri, 29 Oct 2021 16:08:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635516511;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VWi/8qS5XFrzBE8aua33Z9zBlA/oBuG4RRXIeS7cwlg=;
	b=fCKBAFVBZ67xWc2PV5PXRFagUunZuqwsqX/+okrkZd8cbTzECP5n7hVfL0Qng2PtDefD8q
	25sbA1uBaUtcn5+DJTyhKTHl23kf3XV8U6ZjSEb2v92NGyHStmLwfip0Vc9WcuLbY2BVJO
	ndf8ySzBCLkabW6hYDwGA5txtBM4LUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-Dv8fG56pMF24HOb85RFevA-1; Fri, 29 Oct 2021 10:08:27 -0400
X-MC-Unique: Dv8fG56pMF24HOb85RFevA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B42E1018720;
	Fri, 29 Oct 2021 14:08:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E084926E50;
	Fri, 29 Oct 2021 14:08:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D5A4F4EA2A;
	Fri, 29 Oct 2021 14:08:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19TE3BXY014347 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 29 Oct 2021 10:03:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C0A0B79446; Fri, 29 Oct 2021 14:03:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5727F79452;
	Fri, 29 Oct 2021 14:02:37 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <163363944839.1980952.3311507543724895463.stgit@warthog.procyon.org.uk>
References: <163363944839.1980952.3311507543724895463.stgit@warthog.procyon.org.uk>
	<163363935000.1980952.15279841414072653108.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Date: Fri, 29 Oct 2021 15:02:36 +0100
Message-ID: <1876665.1635516156@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 19TE3BXY014347
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, Steve French <sfrench@samba.org>,
	linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v3 07/10] cifs: (untested) Move to using
	the alternate fallback fscache I/O API
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-ID: <1876664.1635516156.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Howells <dhowells@redhat.com> wrote:

> Move cifs/smb to using the alternate fallback fscache I/O API instead of
> the old upstream I/O API as that is about to be deleted.  The alternate API
> will also be deleted at some point in the future as it's dangerous (as is
> the old API) and can lead to data corruption if the backing filesystem can
> insert/remove bridging blocks of zeros into its extent list[1].
> 
> The alternate API reads and writes pages synchronously, with the intention
> of allowing removal of the operation management framework and thence the
> object management framework from fscache.
> 
> The preferred change would be to use the netfs lib, but the new I/O API can
> be used directly.  It's just that as the cache now needs to track data for
> itself, caching blocks may exceed page size...
> 
> Changes
> =======
> ver #2:
>   - Changed "deprecated" to "fallback" in the new function names[2].

I've managed to test this now.  There was a bug in it, fixed by the following
incremental change:

--- a/fs/cifs/fscache.h
+++ b/fs/cifs/fscache.h
@@ -75,7 +75,7 @@ static inline int cifs_readpage_from_fscache(struct inode *inode,
 static inline void cifs_readpage_to_fscache(struct inode *inode,
 					    struct page *page)
 {
-	if (PageFsCache(page))
+	if (CIFS_I(inode)->fscache)
 		__cifs_readpage_to_fscache(inode, page);
 }
 

It shouldn't be using PageFsCache() here.  That's only used to indicate that
an async DIO is in progress on the page, but since we're using the synchronous
fallback API, that should not happen.  Also, it's no longer used to indicate
that a page is being cached and trigger writeback that way.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

