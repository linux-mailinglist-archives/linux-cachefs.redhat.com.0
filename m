Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 335BB433E69
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Oct 2021 20:29:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-YOdiW--fNy-8uVnzk-lBtw-1; Tue, 19 Oct 2021 14:29:32 -0400
X-MC-Unique: YOdiW--fNy-8uVnzk-lBtw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB45310A8E02;
	Tue, 19 Oct 2021 18:29:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC6335F4E0;
	Tue, 19 Oct 2021 18:29:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 81A751801241;
	Tue, 19 Oct 2021 18:29:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19JITPcs020051 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 19 Oct 2021 14:29:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5F4B340CFD11; Tue, 19 Oct 2021 18:29:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A98440CFD10
	for <linux-cachefs@redhat.com>; Tue, 19 Oct 2021 18:29:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41D9B811E78
	for <linux-cachefs@redhat.com>; Tue, 19 Oct 2021 18:29:25 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-383--zNDo3nOMXu93ggoQmhuqA-1; Tue, 19 Oct 2021 14:29:23 -0400
X-MC-Unique: -zNDo3nOMXu93ggoQmhuqA-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1mctqE-00Bvpr-F1; Tue, 19 Oct 2021 18:28:14 +0000
Date: Tue, 19 Oct 2021 19:28:02 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YW8OMsrEzrY8aSxo@casper.infradead.org>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
	<163456863216.2614702.6384850026368833133.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <163456863216.2614702.6384850026368833133.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Steve French <sfrench@samba.org>, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 01/67] mm: Stop filemap_read() from
 grabbing a superfluous page
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 18, 2021 at 03:50:32PM +0100, David Howells wrote:
> @@ -2625,6 +2625,10 @@ ssize_t filemap_read(struct kiocb *iocb, struct iov_iter *iter,
>  		if ((iocb->ki_flags & IOCB_WAITQ) && already_read)
>  			iocb->ki_flags |= IOCB_NOWAIT;
>  
> +		isize = i_size_read(inode);
> +		if (unlikely(iocb->ki_pos >= isize))
> +			goto put_pages;
> +

Is there a good reason to assign to isize here?  I'd rather not,
because it complicates analysis, and a later change might look at
the isize read here, not realising it was a racy use.  So I'd
rather see:

		if (unlikely(iocb->ki_pos >= i_size_read(inode)))
			goto put_pages;

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

