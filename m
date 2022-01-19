Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 88262493706
	for <lists+linux-cachefs@lfdr.de>; Wed, 19 Jan 2022 10:18:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642583908;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Jdx5TqatJgMnXWyOeGF47ei0VXqA+midWCvtumz3MPM=;
	b=LF4QiDY5T6Yrb6GxCGAhv3DG73cg47c2J4diNeLQC2zd8uMhn0tQiqdQaOU1pUQNUI6OYi
	ZRqFaRMRXZAfs2Nm+f9Jxt+QSIZYarlTTxN2xHRnKj5uX4JFhRrqYN8DXFKz53E5/ABeRc
	Qza1QCcR/F8lHz5F6m38QPR8SB5FvoM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-Xw51TIyKN2yOa_Yqg3UrLw-1; Wed, 19 Jan 2022 04:18:27 -0500
X-MC-Unique: Xw51TIyKN2yOa_Yqg3UrLw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61737814245;
	Wed, 19 Jan 2022 09:18:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D906B7B9E2;
	Wed, 19 Jan 2022 09:18:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B583F4BB7C;
	Wed, 19 Jan 2022 09:18:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20J9II4f018012 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 04:18:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1A90E7B9E4; Wed, 19 Jan 2022 09:18:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 163D27B9D6;
	Wed, 19 Jan 2022 09:18:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YeefizLOGt1Qf35o@infradead.org>
References: <YeefizLOGt1Qf35o@infradead.org> <YebpktrcUZOlBHkZ@infradead.org>
	<164251396932.3435901.344517748027321142.stgit@warthog.procyon.org.uk>
	<164251409447.3435901.10092442643336534999.stgit@warthog.procyon.org.uk>
	<3613681.1642527614@warthog.procyon.org.uk>
To: Christoph Hellwig <hch@infradead.org>
MIME-Version: 1.0
Date: Wed, 19 Jan 2022 09:18:05 +0000
Message-ID: <3765724.1642583885@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 20J9II4f018012
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <smfrench@gmail.com>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	v9fs-developer@lists.sourceforge.net
Subject: Re: [Linux-cachefs] [PATCH 09/11] vfs,
	fscache: Add an IS_KERNEL_FILE() macro for the S_KERNEL_FILE flag
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3765723.1642583885.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Christoph Hellwig <hch@infradead.org> wrote:

> On Tue, Jan 18, 2022 at 05:40:14PM +0000, David Howells wrote:
> > Christoph Hellwig <hch@infradead.org> wrote:
> > 
> > > On Tue, Jan 18, 2022 at 01:54:54PM +0000, David Howells wrote:
> > > > Add an IS_KERNEL_FILE() macro to test the S_KERNEL_FILE inode flag as is
> > > > common practice for the other inode flags[1].
> > > 
> > > Please fix the flag to have a sensible name first, as the naming of the
> > > flag and this new helper is utterly wrong as we already discussed.
> > 
> > And I suggested a new name, which you didn't comment on.
> 
> Again, look at the semantics of the flag:  The only thing it does in the
> VFS is to prevent a rmdir.  So you might want to name it after that.
> 
> Or in fact drop the flag entirely.  We don't have that kind of
> protection for other in-kernel file use or important userspace daemons
> either.  I can't see why cachefiles is the magic snowflake here that
> suddenly needs semantics no one else has.

The flag cannot just be dropped - it's an important part of the interaction
with cachefilesd with regard to culling.  Culling to free up space is
offloaded to userspace rather than being done within the kernel.

Previously, cachefiles, the kernel module, had to maintain a huge tree of
records of every backing inode that it was currently using so that it could
forbid cachefilesd to cull one when cachefilesd asked.  I've reduced that to a
single bit flag on the inode struct, thereby saving both memory and time.  You
can argue whether it's worth sacrificing an inode flag bit for that, but the
flag can be reused for any other kernel service that wants to similarly mark
an inode in use.

Further, it's used as a mark to prevent cachefiles accidentally using an inode
twice - say someone misconfigures a second cache overlapping the first - and,
again, this works if some other kernel driver wants to mark inode it is using
in use.  Cachefiles will refuse to use them if it ever sees them, so no
problem there.

And it's not true that we don't have that kind of protection for other
in-kernel file use.  See S_SWAPFILE.  I did consider using that, but that has
other side effects.  I mentioned that perhaps I should make swapon set
S_KERNEL_FILE also.  Also blockdevs have some exclusion also, I think.

The rmdir thing should really apply to rename and unlink also.  That's to
prevent someone, cachefilesd included, causing cachefiles to malfunction by
removing the directories it created.  Possibly this should be a separate bit
to S_KERNEL_FILE, maybe S_NO_DELETE.

So I could change S_KERNEL_FILE to S_KERNEL_LOCK, say, or maybe S_EXCLUSIVE.

David


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

