Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DD5303590BD
	for <lists+linux-cachefs@lfdr.de>; Fri,  9 Apr 2021 02:00:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-ITc0qBEJN_yNPggQR8-z_g-1; Thu, 08 Apr 2021 20:00:29 -0400
X-MC-Unique: ITc0qBEJN_yNPggQR8-z_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70E77817469;
	Fri,  9 Apr 2021 00:00:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89A7B5D71D;
	Fri,  9 Apr 2021 00:00:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90E155533F;
	Fri,  9 Apr 2021 00:00:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 138NuQRL027130 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 8 Apr 2021 19:56:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5052F103422; Thu,  8 Apr 2021 23:56:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A42110342D
	for <linux-cachefs@redhat.com>; Thu,  8 Apr 2021 23:56:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA76985A5A8
	for <linux-cachefs@redhat.com>; Thu,  8 Apr 2021 23:56:23 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-139-8qX2wd36PuiwPk0lxAwQXA-1; Thu, 08 Apr 2021 19:56:22 -0400
X-MC-Unique: 8qX2wd36PuiwPk0lxAwQXA-1
Received: by mail-lj1-f182.google.com with SMTP id u10so4324658lju.7
	for <linux-cachefs@redhat.com>; Thu, 08 Apr 2021 16:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XLF2Hy47tG/NhXLeWFJjwjLlXpGjFs6Bt2Vh546exGI=;
	b=VUqFxG2IhgL5ygoizoLaDo9fA1tIonGJJs6/Sff1lRy1uuVN/Pnn23ekjGkZoktNpc
	R9uix3uWPBpgIZqnXJtM00dqfS4optcgmOzen1ITzi8TPACmcwfKtr+bA10bDayKxzK2
	DJIh5mWml0QEhe+Mf0o5m1B/U8/z0TkwOZvApZVZ5xJBxFDXNctneqkb7K/CN/Rs1EV0
	I4oB12w5pnSVcqOIIXlVv/RYtJb4VUwr1fuEhDRBuDZGy+tPzu8DgyHS4tiBU6llm9us
	m7Ajuc+4Hhy7Av9NH33pVW+0hSZgHYgFUX1NCh8to6dVpQHeKOaUbeuLEW9Mb0esDWmq
	sJpg==
X-Gm-Message-State: AOAM5306pgcIuyqcMpXu7y6UIHNKMZZauZ/VoO71lJtcMi51jrS3d/Te
	IhqRFgINCweEMwA+LuyER7jDdWBzpwng8eg5
X-Google-Smtp-Source: ABdhPJx8j5w0+EPyNUh3sbbGXEIUfRxIV4azrgZBam0knjgflvi1qcvVDNY6rhhsiFHQCNXem4L7eQ==
X-Received: by 2002:a2e:9bcd:: with SMTP id w13mr7569314ljj.43.1617926180346; 
	Thu, 08 Apr 2021 16:56:20 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
	[209.85.167.54])
	by smtp.gmail.com with ESMTPSA id n8sm89482lfh.237.2021.04.08.16.56.20
	for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 08 Apr 2021 16:56:20 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id g8so6787007lfv.12
	for <linux-cachefs@redhat.com>; Thu, 08 Apr 2021 16:56:20 -0700 (PDT)
X-Received: by 2002:ac2:5974:: with SMTP id h20mr5012619lfp.40.1617925853980; 
	Thu, 08 Apr 2021 16:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210408145057.GN2531743@casper.infradead.org>
	<161789062190.6155.12711584466338493050.stgit@warthog.procyon.org.uk>
	<161789066013.6155.9816857201817288382.stgit@warthog.procyon.org.uk>
	<46017.1617897451@warthog.procyon.org.uk>
	<136646.1617916529@warthog.procyon.org.uk>
In-Reply-To: <136646.1617916529@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 8 Apr 2021 16:50:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi_XrtTanTwoKs0jwnjhSvwpMYVDJ477VtjvvTXRjm5wQ@mail.gmail.com>
Message-ID: <CAHk-=wi_XrtTanTwoKs0jwnjhSvwpMYVDJ477VtjvvTXRjm5wQ@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Linux-MM <linux-mm@kvack.org>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-cachefs] [RFC][PATCH] mm: Split page_has_private() in
	two to better handle PG_private_2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 8, 2021 at 2:15 PM David Howells <dhowells@redhat.com> wrote:
>
> mm: Split page_has_private() in two to better handle PG_private_2

>From a look through the patch and some (limited) thinking about it, I
like the patch. I think it clarifies the two very different cases, and
makes it clear that one is about that page cleanup, and the other is
about the magical reference counting. The two are separate issues,
even if for PG_private both happen to be true.

So this seems sane to me.

That said, I had a couple of reactions:

> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 04a34c08e0a6..04cb440ce06e 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -832,14 +832,27 @@ static inline void ClearPageSlabPfmemalloc(struct page *page)
>
>  #define PAGE_FLAGS_PRIVATE                             \
>         (1UL << PG_private | 1UL << PG_private_2)

I think this should be re-named to be PAGE_FLAGS_CLEANUP, because I
don't think it makes any other sense to "combine" the two PG_private*
bits any more. No?

> +static inline int page_private_count(struct page *page)
> +{
> +       return test_bit(PG_private, &page->flags) ? 1 : 0;
> +}

Why is this open-coding the bit test, rather than just doing

        return PagePrivate(page) ? 1 : 0;

instead? In fact, since test_bit() _should_ return a 'bool', I think even just

        return PagePrivate(page);

should work and give the same result, but I could imagine that some
architecture version of "test_bit()" might return some other non-zero
value (although honestly, I think that should be fixed if so).

                Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

