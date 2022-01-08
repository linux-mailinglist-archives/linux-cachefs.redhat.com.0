Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 140D9488210
	for <lists+linux-cachefs@lfdr.de>; Sat,  8 Jan 2022 08:17:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-RbUjiuZAM7Oh7maiOMvRAA-1; Sat, 08 Jan 2022 02:17:51 -0500
X-MC-Unique: RbUjiuZAM7Oh7maiOMvRAA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2C751808321;
	Sat,  8 Jan 2022 07:17:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67EC34EDC1;
	Sat,  8 Jan 2022 07:17:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C7D5F1809C88;
	Sat,  8 Jan 2022 07:17:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 2087HiYB031385 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 8 Jan 2022 02:17:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0D055492D52; Sat,  8 Jan 2022 07:17:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08878492D17
	for <linux-cachefs@redhat.com>; Sat,  8 Jan 2022 07:17:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 950FF1C05EDB
	for <linux-cachefs@redhat.com>; Sat,  8 Jan 2022 07:17:42 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-3-cdHc9jcDORCbvn73PcAgRQ-1; Sat, 08 Jan 2022 02:17:39 -0500
X-MC-Unique: cdHc9jcDORCbvn73PcAgRQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1n65yn-000Uuc-Lb; Sat, 08 Jan 2022 07:17:33 +0000
Date: Sat, 8 Jan 2022 07:17:33 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <Ydk6jWmFH6TZLPZq@casper.infradead.org>
References: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
	<164021541207.640689.564689725898537127.stgit@warthog.procyon.org.uk>
	<CAOQ4uxjEcvffv=rNXS-r+NLz+=6yk4abRuX_AMq9v-M4nf_PtA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOQ4uxjEcvffv=rNXS-r+NLz+=6yk4abRuX_AMq9v-M4nf_PtA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	CIFS <linux-cifs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jan 08, 2022 at 09:08:57AM +0200, Amir Goldstein wrote:
> > +#define S_KERNEL_FILE  (1 << 17) /* File is in use by the kernel (eg. fs/cachefiles) */
> 
> Trying to brand this flag as a generic "in use by kernel" is misleading.
> Modules other than cachefiles cannot set/clear this flag, because then
> cachefiles won't know that it is allowed to set/clear the flag.

Huh?  If some other kernel module sets it, cachefiles will try to set it,
see it's already set, and fail.  Presumably cachefiles does not go round
randomly "unusing" files that it has not previously started using.

I mean, yes, obviously, it's a kernel module, it can set and clear
whatever flags it likes on any inode in the system, but conceptually,
it's an advisory whole-file lock.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

