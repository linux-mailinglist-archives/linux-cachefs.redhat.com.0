Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A397546F64D
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Dec 2021 22:57:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639087071;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/2cy4kQPXK5R7YchjNiBQdQKMzvIqyW/NQmRSWm3Lag=;
	b=gWnsUeXWPbtrH/EdRbaR8MZvE+F9G8riKk+MJueOKE/TnuFdu5zLj4eKKgk2WQGEEWwalo
	qxjuP+sf8qBOZUdSwcJdIpOhZEzYwyHNb8E04mHNbxrGGn6nm95pRb36jbCe4UzbFO8trP
	ejnLCHgXmfnVccC9pqmJTbQy3EfCfXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-ojQ0zHhMOnK_h8ePN-lYQA-1; Thu, 09 Dec 2021 16:57:48 -0500
X-MC-Unique: ojQ0zHhMOnK_h8ePN-lYQA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50281192CC43;
	Thu,  9 Dec 2021 21:57:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BD2068D94;
	Thu,  9 Dec 2021 21:57:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 624E81809CB8;
	Thu,  9 Dec 2021 21:57:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B9Lvds7012601 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 9 Dec 2021 16:57:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0992E1042A9C; Thu,  9 Dec 2021 21:57:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB9EB1017E27;
	Thu,  9 Dec 2021 21:57:33 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wiTquFUu-b5ME=rbGEF8r2Vh1TXGfaZZuXyOutVrgRzfw@mail.gmail.com>
References: <CAHk-=wiTquFUu-b5ME=rbGEF8r2Vh1TXGfaZZuXyOutVrgRzfw@mail.gmail.com>
	<163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
	<163906888735.143852.10944614318596881429.stgit@warthog.procyon.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Date: Thu, 09 Dec 2021 21:57:33 +0000
Message-ID: <159180.1639087053@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1B9Lvds7012601
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, "open list:NFS,
	SUNRPC, AND..." <linux-nfs@vger.kernel.org>,
	CIFS <linux-cifs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	v9fs-developer@lists.sourceforge.net, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v2 07/67] fscache: Implement a hash
	function
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <159179.1639087053.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> > Implement a function to generate hashes.  It needs to be stable over time
> > and endianness-independent as the hashes will appear on disk in future
> > patches.
> 
> I'm not actually seeing this being endianness-independent.
> 
> Is the input just regular 32-bit data in native word order? Because
> then it's not endianness-independent, it's purely that there *is* no
> endianness to the data at all and it is purely native data.
>
> So the code may be correct, but the explanation is confusing. There is
> absolutely nothing here that is about endianness.

What I'm trying to get at is that the hash needs to be consistent, no matter
the endianness of the cpu, for any particular input blob.  The hashing
function shouldn't need to know the structure of the input blob.  In the case
of the volume key, it's a padded printable string; in the case of the cookie
key, it's probably some sort of structured blob, quite possibly an actual
array of be32.

The reason it needs to be consistent is that people seem to like seeding the
cache by tarring up the cache from one machine and untarring it on another.

And looking again at my code:

unsigned int fscache_hash(unsigned int salt, unsigned int *data, unsigned int n)
{
	unsigned int a, x = 0, y = salt;

	for (; n; n--) {
		a = *data++;   <<<<<<<
		HASH_MIX(x, y, a);
	}
	return fold_hash(x, y);
}

The marked line should probably use something like le/be32_to_cpu().

I also need to fix 9p to canonicalise its cookie key.

Thanks for catching that,
David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

