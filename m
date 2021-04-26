Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7414636BB4F
	for <lists+linux-cachefs@lfdr.de>; Mon, 26 Apr 2021 23:39:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619473188;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p5yePmOBe7o29TUR/LEJCm1qYUIGDYwD0hNVD7XAbTc=;
	b=Vww+wQYuW2c8OrNyjNToJuoRMzoFxQKI+IA4VhvkAdTvFpffLqMQdq1/RWjSMACgnGXbUy
	a+0XLzNkVUVlsnMpz5qcCWIDIALk6VPHWCcCYEoZi04TboBe6z8BCUZrVRRpTo2LKn8Bq3
	StH/Q/xB79XZMkxYiTf1c72VaTRgMZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-k2JcIIACPYi_7ddgI9MnFQ-1; Mon, 26 Apr 2021 17:39:46 -0400
X-MC-Unique: k2JcIIACPYi_7ddgI9MnFQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88C58100670C;
	Mon, 26 Apr 2021 21:39:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 743F31037EA4;
	Mon, 26 Apr 2021 21:39:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E2471806D1A;
	Mon, 26 Apr 2021 21:39:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13QLdeAG031689 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 26 Apr 2021 17:39:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2D6CC18219; Mon, 26 Apr 2021 21:39:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx01.redhat.com
	(mimecast06.extmail.prod.ext.phx2.redhat.com [10.5.110.77])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 282CC5C67A
	for <linux-cachefs@redhat.com>; Mon, 26 Apr 2021 21:39:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4941583DD22
	for <linux-cachefs@redhat.com>; Mon, 26 Apr 2021 21:39:36 +0000 (UTC)
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
	[209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-79-j9Ov5G_wNYedxdUScnS_-g-1; Mon, 26 Apr 2021 17:39:34 -0400
X-MC-Unique: j9Ov5G_wNYedxdUScnS_-g-1
Received: by mail-yb1-f198.google.com with SMTP id
	a7-20020a5b00070000b02904ed415d9d84so13339531ybp.0
	for <linux-cachefs@redhat.com>; Mon, 26 Apr 2021 14:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NHuvsACEl1CI5awLj29+rd0noL/P2DJNg9HAwjCVAH0=;
	b=OInu6DCiNy5y3Exj0pL7qsNkMwwVsknbkbU+8jYyUEt+KKHHuBPn3Nw621zlBO7OiS
	zuYqHhmG2A6rJDI7UzfwD0acfRRf5zeJEQwB4jv3Lxke9pv5Z8CWpTFlFZxbLS37DDvo
	beeZ2R4qr3qmHIRsa3CzhFeQnz7k6OJhzWrDrinFMUvlZi/qdF83RyS9uKmHOef/E48v
	V6gTAcMkiQCTlhfpEGPgarw4dRd83YSZXgbfz6zwrZ3Wj+YxOqzJzV9qyvRigbKxiQ+C
	vtLtLsZKK2FsMAIYpmkElzXtueJBCnAtOl8aeFntGiA/epqI+A/zRtSFXnSPT9U81ZDC
	2eYg==
X-Gm-Message-State: AOAM5328WgzLJ9NmOv2CjgPmNJ2SyowvWmY4XMj3/NhRQJgGpKqUOAL9
	07CTMF5/vr9lrGJTKSEV3uA2AxXAtpdxv8XDTVm0U7cQFy1uChH20bVB7B55tO0V5EZD0Rrc/ty
	VIDMsi1u9I7MlYNvJ3ZSj9GXNY6xyZxoEc7S08g==
X-Received: by 2002:a25:570b:: with SMTP id l11mr29088369ybb.335.1619473173579;
	Mon, 26 Apr 2021 14:39:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/wXyKLI4TMmIO0Z2ws4xZcCt+U06V+2s2ssmR8wS8k2UbBaQ4UBIARhy5tO0ovMMwmoBxnLEWETwJaLxTado=
X-Received: by 2002:a25:570b:: with SMTP id l11mr29088337ybb.335.1619473173244;
	Mon, 26 Apr 2021 14:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
	<161918448151.3145707.11541538916600921083.stgit@warthog.procyon.org.uk>
	<3545034.1619392490@warthog.procyon.org.uk>
In-Reply-To: <3545034.1619392490@warthog.procyon.org.uk>
From: David Wysochanski <dwysocha@redhat.com>
Date: Mon, 26 Apr 2021 17:38:57 -0400
Message-ID: <CALF+zOk84B5xFZ6kFMOQb8KYkxZgMFmSBboEfsgSFNL_N5uCyA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs <linux-cifs@vger.kernel.org>,
	linux-nfs <linux-nfs@vger.kernel.org>, linux-mm@kvack.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	linux-cachefs <linux-cachefs@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH] iov_iter: Four fixes for ITER_XARRAY
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Apr 25, 2021 at 7:15 PM David Howells <dhowells@redhat.com> wrote:
>
> Hi Al,
>
> I think this patch should include all the fixes necessary.  I could merge
> it in, but I think it might be better to tag it on the end as an additional
> patch.
>
> David
> ---
> iov_iter: Four fixes for ITER_XARRAY
>
> Fix four things[1] in the patch that adds ITER_XARRAY[2]:
>
>  (1) Remove the address_space struct predeclaration.  This is a holdover
>      from when it was ITER_MAPPING.
>
>  (2) Fix _copy_mc_to_iter() so that the xarray segment updates count and
>      iov_offset in the iterator before returning.
>
>  (3) Fix iov_iter_alignment() to not loop in the xarray case.  Because the
>      middle pages are all whole pages, only the end pages need be
>      considered - and this can be reduced to just looking at the start
>      position in the xarray and the iteration size.
>
>  (4) Fix iov_iter_advance() to limit the size of the advance to no more
>      than the remaining iteration size.
>
> Reported-by: Al Viro <viro@zeniv.linux.org.uk>
> Signed-off-by: David Howells <dhowells@redhat.com>
> Link: https://lore.kernel.org/r/YIVrJT8GwLI0Wlgx@zeniv-ca.linux.org.uk [1]
> Link: https://lore.kernel.org/r/161918448151.3145707.11541538916600921083.stgit@warthog.procyon.org.uk [2]
> ---
>  include/linux/uio.h |    1 -
>  lib/iov_iter.c      |    5 +++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/uio.h b/include/linux/uio.h
> index 5f5ffc45d4aa..d3ec87706d75 100644
> --- a/include/linux/uio.h
> +++ b/include/linux/uio.h
> @@ -10,7 +10,6 @@
>  #include <uapi/linux/uio.h>
>
>  struct page;
> -struct address_space;
>  struct pipe_inode_info;
>
>  struct kvec {
> diff --git a/lib/iov_iter.c b/lib/iov_iter.c
> index 44fa726a8323..61228a6c69f8 100644
> --- a/lib/iov_iter.c
> +++ b/lib/iov_iter.c
> @@ -791,6 +791,8 @@ size_t _copy_mc_to_iter(const void *addr, size_t bytes, struct iov_iter *i)
>                         curr_addr = (unsigned long) from;
>                         bytes = curr_addr - s_addr - rem;
>                         rcu_read_unlock();
> +                       i->iov_offset += bytes;
> +                       i->count -= bytes;
>                         return bytes;
>                 }
>                 })
> @@ -1147,6 +1149,7 @@ void iov_iter_advance(struct iov_iter *i, size_t size)
>                 return;
>         }
>         if (unlikely(iov_iter_is_xarray(i))) {
> +               size = min(size, i->count);
>                 i->iov_offset += size;
>                 i->count -= size;
>                 return;
> @@ -1346,6 +1349,8 @@ unsigned long iov_iter_alignment(const struct iov_iter *i)
>                         return size | i->iov_offset;
>                 return size;
>         }
> +       if (unlikely(iov_iter_is_xarray(i)))
> +               return (i->xarray_start + i->iov_offset) | i->count;
>         iterate_all_kinds(i, size, v,
>                 (res |= (unsigned long)v.iov_base | v.iov_len, 0),
>                 res |= v.bv_offset | v.bv_len,
>

You can add
Tested-by: Dave Wysochanski <dwysocha@redhat.com>

I added this patch on top of your v7 series then added my current
NFS patches to use netfs lib.
I ran xfstests with fscache enabled on NFS versions (3, 4.0, 4.1, 4.2),
as well as connectathon and some unit tests.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

