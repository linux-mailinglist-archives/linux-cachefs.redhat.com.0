Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8BD240B04
	for <lists+linux-cachefs@lfdr.de>; Mon, 10 Aug 2020 18:13:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-xeuPyHbRM2ejRyXKAyUFPg-1; Mon, 10 Aug 2020 12:12:57 -0400
X-MC-Unique: xeuPyHbRM2ejRyXKAyUFPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C21F1B18BC0;
	Mon, 10 Aug 2020 16:12:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6146C60BE2;
	Mon, 10 Aug 2020 16:12:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9A191809557;
	Mon, 10 Aug 2020 16:12:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07AGAFwR016646 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 12:10:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2BC462097D60; Mon, 10 Aug 2020 16:10:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 274262097D64
	for <linux-cachefs@redhat.com>; Mon, 10 Aug 2020 16:10:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55E32100CF84
	for <linux-cachefs@redhat.com>; Mon, 10 Aug 2020 16:10:12 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-302-xiExAD3tMAqggegwVZLIbA-1; Mon, 10 Aug 2020 12:10:06 -0400
X-MC-Unique: xiExAD3tMAqggegwVZLIbA-1
Received: by mail-io1-f68.google.com with SMTP id a5so9434767ioa.13;
	Mon, 10 Aug 2020 09:10:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MZ80cO9LgIseSA6VcNmJzpLJOqoglGp0soH8ddcaoxk=;
	b=B9YJLtlG+WG2pTaA7mfoJu63t4LSNJ+II99V1QfavABtxyuMT2omwpyBeCoEhl5qmx
	tz1J8AyO6D9T8f4PgPCi6z2y39ea0GmdTxkv5rxBeLizaUCt869D/QYXyRWJyrtmbyyr
	eUDAiwqQrfNpvgGYui6tK08zuYBEm6mVCRDfp2kLk/zfE91UDFy1TVIyKBrb4l0gx8hf
	cUpEjYjTOAHiUk18e6BXNtzAlk9/TV/V0P0/vIduSgcQm10iQGszjEd5T8wsGBaX3lox
	abf0NnLwkVtBsqHEttOWQSTr7H+a6AGQLNncHI3MZkAVLf1xdrVA374O84dcw4VhMgtq
	38QA==
X-Gm-Message-State: AOAM5335+alIYYt7hUMMcWaBs4xlT3tO6BpMs09tBTFDeCcr3aZSNWDI
	h3pcnpBHRHFr/A93evq9XLLGCC9wPMdY+z8oK4ehmJOb3G4=
X-Google-Smtp-Source: ABdhPJyTY4QlAr8BTih462f1lgyS9bJi/R2Ew8ZaVjmxeOvg71SlD2qbh1tJxbs+xTPFWT+NxUm+fxwz6XlvyZjiHMI=
X-Received: by 2002:a05:6638:bd1:: with SMTP id
	g17mr20966062jad.132.1597075803972; 
	Mon, 10 Aug 2020 09:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <447452.1596109876@warthog.procyon.org.uk>
	<1851200.1596472222@warthog.procyon.org.uk>
	<667820.1597072619@warthog.procyon.org.uk>
	<CAH2r5msKipj1exNUDaSUN7h0pjanOenhSg2=EWYMv_h15yKtxg@mail.gmail.com>
	<672169.1597074488@warthog.procyon.org.uk>
In-Reply-To: <672169.1597074488@warthog.procyon.org.uk>
From: Steve French <smfrench@gmail.com>
Date: Mon, 10 Aug 2020 11:09:53 -0500
Message-ID: <CAH2r5msO+N9dXKtYE3p+EfXaZTtqp6r=Bsx5vKdTdxe7XBBeOw@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: CIFS <linux-cifs@vger.kernel.org>, linux-nfs <linux-nfs@vger.kernel.org>,
	linux-afs@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-cachefs] [GIT PULL] fscache rewrite -- please drop for
	now
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 10, 2020 at 10:48 AM David Howells <dhowells@redhat.com> wrote:
>
> Steve French <smfrench@gmail.com> wrote:
>
> > cifs.ko also can set rsize quite small (even 1K for example, although
> > that will be more than 10x slower than the default 4MB so hopefully no
> > one is crazy enough to do that).
>
> You can set rsize < PAGE_SIZE?

I have never seen anyone do it and it would be crazy to set it so
small (would hurt
performance a lot and cause extra work on client and server) but yes
it can be set
very small. Apparently NFS can also set rsize to 1K as well (see
https://linux.die.net/man/5/nfs)

I don't mind adding a minimum rsize check for cifs.ko (preventing a
user from setting
rsize below page size for example) if there is a precedent for this in
other fs or
bug that it would cause.   In general my informal perf measurements showed
slight advantages to all servers with larger rsizes up to 4MB (thus
cifs client will
negotiate 4MB by default even if server supports larger), but
overriding rsize (larger)
on mount by having the user setting rsize to 8MB on mount could help
perf to some
servers. I am hoping we can figure out a way to automatically
determine when to negotiate
rsize larger than 4MB but in the meantime rsize will almost always be
4MB (or 1MB on
mounts to some older servers) for cifs but some users will benefit
slightly from manually
setting it to 8MB.

> > I can't imagine an SMB3 server negotiating an rsize or wsize smaller than
> > 64K in today's world (and typical is 1MB to 8MB) but the user can specify a
> > much smaller rsize on mount.  If 64K is an adequate minimum, we could change
> > the cifs mount option parsing to require a certain minimum rsize if fscache
> > is selected.
>
> I've borrowed the 256K granule size used by various AFS implementations for
> the moment.  A 512-byte xattr can thus hold a bitmap covering 1G of file
> space.
>
> David
>


-- 
Thanks,

Steve

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

