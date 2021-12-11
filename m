Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E50047140A
	for <lists+linux-cachefs@lfdr.de>; Sat, 11 Dec 2021 14:38:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639229884;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+OhFTT20RPFIBiN3bNY4XtYDiwO/kPeayelYk8IO2tc=;
	b=go39mSz2xGpVjUAXhdxg2y+pWhB3RTDT4w1ZcAQ3LR4mbeuySEf6eGVlHs9Ln3Ff61p9rN
	3z/G0Lwwwd0T8KcBYzgFsAaSiDM0//0lpglzT97nvPwqYDvALRXgwjvXn6Ku8qYOP2QGlL
	EHEAG0OB7jTQXzacm07gdbkMgReF3z8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-3ZudLerhMb6gNkXKWBbmGw-1; Sat, 11 Dec 2021 08:38:01 -0500
X-MC-Unique: 3ZudLerhMb6gNkXKWBbmGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B07DB1006AA0;
	Sat, 11 Dec 2021 13:37:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13C1A45D9;
	Sat, 11 Dec 2021 13:37:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7BA121806D03;
	Sat, 11 Dec 2021 13:37:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BBDbrVY019399 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 11 Dec 2021 08:37:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1E11E88F6; Sat, 11 Dec 2021 13:37:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7BBF188F7;
	Sat, 11 Dec 2021 13:37:45 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CALF+zOknSu_qkb9N0i4LY8tUtXmXirSsU7gGZsUOtLu8c88ieg@mail.gmail.com>
References: <CALF+zOknSu_qkb9N0i4LY8tUtXmXirSsU7gGZsUOtLu8c88ieg@mail.gmail.com>
	<163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
	<163906979003.143852.2601189243864854724.stgit@warthog.procyon.org.uk>
To: David Wysochanski <dwysocha@redhat.com>
MIME-Version: 1.0
Date: Sat, 11 Dec 2021 13:37:44 +0000
Message-ID: <353628.1639229864@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1BBDbrVY019399
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs <linux-nfs@vger.kernel.org>,
	linux-afs@lists.infradead.org, linux-cifs <linux-cifs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	v9fs-developer@lists.sourceforge.net,
	linux-cachefs <linux-cachefs@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH v2 62/67] nfs: Convert to new fscache
	volume/cookie API
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <353627.1639229864.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Wysochanski <dwysocha@redhat.com> wrote:

> >  (4) fscache_enable/disable_cookie() have been removed.
> >
> >      Call fscache_use_cookie() and fscache_unuse_cookie() when a file is
> >      opened or closed to prevent a cache file from being culled and to keep
> >      resources to hand that are needed to do I/O.
> >
> >      Unuse the cookie when a file is opened for writing.  This is gated by
> >      the NFS_INO_FSCACHE flag on the nfs_inode.
> >
> >      A better way might be to invalidate it with FSCACHE_INVAL_DIO_WRITE
> >      which will keep it unused until all open files are closed.
> >
> 
> It looks like the comment doesn't match what was actually done inside
> nfs_fscache_open_file().  Is the code right and the comment just out of date?

The comment is out of date.  NFS_INO_FSCACHE isn't used now.

> I'm getting that kasan UAF firing periodically in this code path, and so it
> looks related to this change,though I don't have great info on it so far and
> it's hard to reproduce.

Can you copy the kasan UAF text into a reply?

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

