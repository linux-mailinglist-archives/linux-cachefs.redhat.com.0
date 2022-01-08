Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B53F048827E
	for <lists+linux-cachefs@lfdr.de>; Sat,  8 Jan 2022 09:41:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641631316;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6YYCVi65eWXwF4zwCcNHSFGKkZKvGfDb9bfyHGqsXXs=;
	b=Y7awQi29MQjsOqAQRPomVEPEWZKgDeHa8HWLki6lL1tvCDc/4i9N2fmGpriSMQvApI55z/
	zKBN23EHhbnRxMsk/Q7e8m/3kr1KbaXEA+mSng+jbj16nne8RRDuv4O39qGiHj5ibpCi86
	RdaYn+ABNQ8mnLEnl2+puAyfu0xyTag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-vEFImFD6N12RUsMIE80XJQ-1; Sat, 08 Jan 2022 03:41:53 -0500
X-MC-Unique: vEFImFD6N12RUsMIE80XJQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A9C2802924;
	Sat,  8 Jan 2022 08:41:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A24EA7CAF0;
	Sat,  8 Jan 2022 08:41:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CEAE1809CB8;
	Sat,  8 Jan 2022 08:41:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 2088fZU8003633 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 8 Jan 2022 03:41:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6EF245F922; Sat,  8 Jan 2022 08:41:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DA3CF5F92A;
	Sat,  8 Jan 2022 08:41:27 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAOQ4uxjEcvffv=rNXS-r+NLz+=6yk4abRuX_AMq9v-M4nf_PtA@mail.gmail.com>
References: <CAOQ4uxjEcvffv=rNXS-r+NLz+=6yk4abRuX_AMq9v-M4nf_PtA@mail.gmail.com>
	<164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
	<164021541207.640689.564689725898537127.stgit@warthog.procyon.org.uk>
To: Amir Goldstein <amir73il@gmail.com>
MIME-Version: 1.0
Date: Sat, 08 Jan 2022 08:41:26 +0000
Message-ID: <3492171.1641631286@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 2088fZU8003633
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	CIFS <linux-cifs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3492170.1641631286.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Amir Goldstein <amir73il@gmail.com> wrote:

> > -       if (is_local_mountpoint(dentry))
> > +       if (is_local_mountpoint(dentry) ||
> > +           (dentry->d_inode->i_flags & S_KERNEL_FILE))
> 
> Better as this check to the many other checks in may_delete()

Okay.  It will make things a bit more complicated, so I'll do it in a follow
up patch.  The problem is that it will prevent the cachefiles driver in the
kernel from renaming directories and unlinking files as it's currently
removing the mark *after* moving/deleting them.

> > +#define S_KERNEL_FILE  (1 << 17) /* File is in use by the kernel (eg. fs/cachefiles) */
> >
> 
> Trying to brand this flag as a generic "in use by kernel" is misleading.
> Modules other than cachefiles cannot set/clear this flag, because then
> cachefiles won't know that it is allowed to set/clear the flag.

If the flag is set, then cachefiles thinks some other kernel driver is using
the file and it shouldn't try to use it.  It doesn't matter who has it open.

It should never happen as other kernel drivers shouldn't be poking around
inside cachefiles's cache, but possibly someone could misconfigure something.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

