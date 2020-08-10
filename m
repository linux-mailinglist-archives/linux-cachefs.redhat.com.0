Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A2229240B40
	for <lists+linux-cachefs@lfdr.de>; Mon, 10 Aug 2020 18:36:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597077408;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PxEdjLZNU/KGm9gGjU0l00OcS1VkqHnioHwKcN6t8jM=;
	b=MRIf/7DqxrJ2Rf9WSzLoZ42uS4dH8cEP3y4qaoZ3WLOHsLW2f5YAIr6G5hjOUnSgfxBVMy
	5jsN9WjnSXN2GOxzdhGHjTEVv/Gb+yIyX+Wr1K6EZCz/NkPQxt+Lmgh96EMmUOO38oXunZ
	9R/n5Jc1s77rsN7/FE0lL1PlW+2/O5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-zg0SHBXBP_eitStWbw-CKw-1; Mon, 10 Aug 2020 12:36:46 -0400
X-MC-Unique: zg0SHBXBP_eitStWbw-CKw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25AE48015F4;
	Mon, 10 Aug 2020 16:36:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D13246F127;
	Mon, 10 Aug 2020 16:36:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B367A1809554;
	Mon, 10 Aug 2020 16:36:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07AGaZx9019490 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 12:36:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B60FD2097D61; Mon, 10 Aug 2020 16:36:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B172E2097D60
	for <linux-cachefs@redhat.com>; Mon, 10 Aug 2020 16:36:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9CB08007D7
	for <linux-cachefs@redhat.com>; Mon, 10 Aug 2020 16:36:32 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
	[209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-248-LN9tv6gdPTu-miLYfa_L3w-1; Mon, 10 Aug 2020 12:36:31 -0400
X-MC-Unique: LN9tv6gdPTu-miLYfa_L3w-1
Received: by mail-ed1-f70.google.com with SMTP id t9so3418607edw.22
	for <linux-cachefs@redhat.com>; Mon, 10 Aug 2020 09:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E7cstcAHVFGfhscj0UF342G+MM1KSXqD/P1R9pHujqc=;
	b=XekXVKVUcyCsnIPjEbTNyMc4ejqT8ZWSCK9gGwk5rjTIlvWq299vB79G7pVobdWx3+
	v97DY6qCwhRfYW2fxZJw1LvQiN2NNWbMRThukNUJkIkcFJJhgN4VBn0aOuyfxAtel+2s
	pLf4ATgK592zrb/A1/UKwqSmm09Tz8uDdQeHlRqAhUxDhN8wOZbUqmK/hwCnKqdjdmgm
	r5oR4OY/5LwN693aLO8wRsKD/eBiTWti0QFuxrpu+W8LZzEqmSUmEkGzWilHXbyVzL/t
	JWH9mpPyGut8GHKPIg4afqDQdo7lCm2R6K0rIPNmsTeCil060/8bt8BlkQ/AoHIu9w8Y
	pKbg==
X-Gm-Message-State: AOAM531cFQPJZQ/BZ1dg8w36d9blYf0rbbRWmCriNtzreBIoGHDzHtqZ
	bttzdytYVlTNAOrFtQz/f35VRVCKUZWeriVPd6NXrQxQTb7uOXOHeuqzrX/avyVyyJLz4XmosKz
	ro5tipKweFkg5zvEJYuZZfNDlLY4ChwCbz0NRWA==
X-Received: by 2002:a17:906:a4b:: with SMTP id
	x11mr23475875ejf.83.1597077389406; 
	Mon, 10 Aug 2020 09:36:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxf3SVX6ZuISdp8oMWj+mkcjWbaPxLFNRh9thEVecTra/0s+AaKG5bkamyJTprqlXgn7eVTDeevbLYmrbh9t0=
X-Received: by 2002:a17:906:a4b:: with SMTP id
	x11mr23475853ejf.83.1597077389176; 
	Mon, 10 Aug 2020 09:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <447452.1596109876@warthog.procyon.org.uk>
	<1851200.1596472222@warthog.procyon.org.uk>
	<667820.1597072619@warthog.procyon.org.uk>
	<CAH2r5msKipj1exNUDaSUN7h0pjanOenhSg2=EWYMv_h15yKtxg@mail.gmail.com>
	<672169.1597074488@warthog.procyon.org.uk>
In-Reply-To: <672169.1597074488@warthog.procyon.org.uk>
From: David Wysochanski <dwysocha@redhat.com>
Date: Mon, 10 Aug 2020 12:35:53 -0400
Message-ID: <CALF+zO=DkGmNDrrr-WxU6L1Xw8MA4+NrqVbvNMctwSKjy0Yh_w@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: CIFS <linux-cifs@vger.kernel.org>, linux-nfs <linux-nfs@vger.kernel.org>,
	linux-afs@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Steve French <smfrench@gmail.com>, linux-cachefs@redhat.com,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 10, 2020 at 11:48 AM David Howells <dhowells@redhat.com> wrote:
>
> Steve French <smfrench@gmail.com> wrote:
>
> > cifs.ko also can set rsize quite small (even 1K for example, although
> > that will be more than 10x slower than the default 4MB so hopefully no
> > one is crazy enough to do that).
>
> You can set rsize < PAGE_SIZE?
>
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
>

Is it possible to make the granule size configurable, then reject a
registration if the size is too small or not a power of 2?  Then a
netfs using the API could try to set equal to rsize, and then error
out with a message if the registration was rejected.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

