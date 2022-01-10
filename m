Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9CC4893C1
	for <lists+linux-cachefs@lfdr.de>; Mon, 10 Jan 2022 09:39:29 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-sYgojOZSPV-ry9D_VoLN8A-1; Mon, 10 Jan 2022 03:39:25 -0500
X-MC-Unique: sYgojOZSPV-ry9D_VoLN8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB42F100CCC0;
	Mon, 10 Jan 2022 08:39:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D73E57315D;
	Mon, 10 Jan 2022 08:39:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E8BBB1809CB8;
	Mon, 10 Jan 2022 08:39:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20A8dCRx019057 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 10 Jan 2022 03:39:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5E0DE76C9; Mon, 10 Jan 2022 08:39:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5870576C8
	for <linux-cachefs@redhat.com>; Mon, 10 Jan 2022 08:39:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97D6B29AA381
	for <linux-cachefs@redhat.com>; Mon, 10 Jan 2022 08:39:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-381-aBYkJIM_MMC-hEcAZc7SDg-1; Mon, 10 Jan 2022 03:39:01 -0500
X-MC-Unique: aBYkJIM_MMC-hEcAZc7SDg-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1n6pUW-009jUS-SL; Mon, 10 Jan 2022 07:53:20 +0000
Date: Sun, 9 Jan 2022 23:53:20 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <Ydvl8Dk8z0mF0KFl@infradead.org>
References: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
	<164021541207.640689.564689725898537127.stgit@warthog.procyon.org.uk>
	<CAOQ4uxjEcvffv=rNXS-r+NLz+=6yk4abRuX_AMq9v-M4nf_PtA@mail.gmail.com>
	<Ydk6jWmFH6TZLPZq@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <Ydk6jWmFH6TZLPZq@casper.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	CIFS <linux-cifs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Amir Goldstein <amir73il@gmail.com>, Jeff Layton <jlayton@kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-afs@lists.infradead.org,
	v9fs-developer@lists.sourceforge.net, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel <ceph-devel@vger.kernel.org>,
	Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 38/68] vfs,
 cachefiles: Mark a backing file in use with an inode flag
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

On Sat, Jan 08, 2022 at 07:17:33AM +0000, Matthew Wilcox wrote:
> On Sat, Jan 08, 2022 at 09:08:57AM +0200, Amir Goldstein wrote:
> > > +#define S_KERNEL_FILE  (1 << 17) /* File is in use by the kernel (eg. fs/cachefiles) */
> > 
> > Trying to brand this flag as a generic "in use by kernel" is misleading.
> > Modules other than cachefiles cannot set/clear this flag, because then
> > cachefiles won't know that it is allowed to set/clear the flag.
> 
> Huh?  If some other kernel module sets it, cachefiles will try to set it,
> see it's already set, and fail.  Presumably cachefiles does not go round
> randomly "unusing" files that it has not previously started using.
> 
> I mean, yes, obviously, it's a kernel module, it can set and clear
> whatever flags it likes on any inode in the system, but conceptually,
> it's an advisory whole-file lock.

So let's name it that way.  We have plenty of files in kernel use using
filp_open and this flag very obviously means something else.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

