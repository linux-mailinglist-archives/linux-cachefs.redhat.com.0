Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4195E33EF00
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Mar 2021 12:00:51 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-LgE19VjaOUys6Zg4Zx8YCQ-1; Wed, 17 Mar 2021 07:00:48 -0400
X-MC-Unique: LgE19VjaOUys6Zg4Zx8YCQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44E59108BD1D;
	Wed, 17 Mar 2021 11:00:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F341D69321;
	Wed, 17 Mar 2021 11:00:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D68144A700;
	Wed, 17 Mar 2021 11:00:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12H2eggT007240 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 16 Mar 2021 22:40:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7B934AB5BB; Wed, 17 Mar 2021 02:40:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 753D4C2112
	for <linux-cachefs@redhat.com>; Wed, 17 Mar 2021 02:40:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 679C7800140
	for <linux-cachefs@redhat.com>; Wed, 17 Mar 2021 02:40:38 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
	[209.85.218.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-1-mD6lkIjDPuGFT7PpSBNXeQ-1; Tue, 16 Mar 2021 22:40:36 -0400
X-MC-Unique: mD6lkIjDPuGFT7PpSBNXeQ-1
Received: by mail-ej1-f43.google.com with SMTP id c10so129626ejx.9
	for <linux-cachefs@redhat.com>; Tue, 16 Mar 2021 19:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GvkSjbOflTYrrhQW/IujV+Vj77yNYWLHdlNlegrHH4E=;
	b=DiRPhOsR0GnPLzShupV4PGx7zz7Jw7xyXwt4D8jVV4BgyqVnKG4sJiPYLih/NwWRwB
	hYKdhfgNAZXMAKff4fXdPEx6HiSTcj0lK7/k/3N7viY0BWz/qQ393bOwFazlmjTZjY0B
	9BfZaLY8GhtoU0R1p3QDjCNpmBAq/OHt2FTZiUMaGoyZFfH8920uvNRNGPp6pQG9R9+l
	z9rWH0gWc89NFGfD1lTTDDEpAsqk7sLF+DgJgmYKWzeDdE/zlD4CW5NSITzRpQrkIsst
	/HX4ON/i+Y4UkWVsZbmHlHaS8uUtJdO+pQ4TMFFqyKJ3NKLg9UYyl2RNoW68X1dV4qCB
	4dQw==
X-Gm-Message-State: AOAM5323UPaYZ9VNPRzw9TmikJ/573BeB4IFarVMshs6jD1OAdpexA9d
	qwyTRX/ld0VmU/SAVhHqMtfzYmqzasBZmA==
X-Google-Smtp-Source: ABdhPJzqPNGIvIrXHzAPhxZOrYtnuPq9ic6wPmO8AJIFh4Bh5q2z7Wblc7JZkx81PxHxNLmCRWkg/A==
X-Received: by 2002:a17:906:cb18:: with SMTP id
	lk24mr16617903ejb.70.1615948835086; 
	Tue, 16 Mar 2021 19:40:35 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
	[209.85.221.47]) by smtp.gmail.com with ESMTPSA id
	o6sm11510172edw.24.2021.03.16.19.40.34 for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 16 Mar 2021 19:40:34 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id e9so252586wrw.10
	for <linux-cachefs@redhat.com>; Tue, 16 Mar 2021 19:40:34 -0700 (PDT)
X-Received: by 2002:a05:6512:398d:: with SMTP id
	j13mr922688lfu.41.1615948533286; 
	Tue, 16 Mar 2021 19:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <161539526152.286939.8589700175877370401.stgit@warthog.procyon.org.uk>
	<161539528910.286939.1252328699383291173.stgit@warthog.procyon.org.uk>
	<20210316190707.GD3420@casper.infradead.org>
	<CAHk-=wjSGsRj7xwhSMQ6dAQiz53xA39pOG+XA_WeTgwBBu4uqg@mail.gmail.com>
	<887b9eb7-2764-3659-d0bf-6a034a031618@toxicpanda.com>
In-Reply-To: <887b9eb7-2764-3659-d0bf-6a034a031618@toxicpanda.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 16 Mar 2021 19:35:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=whWoJhGeMn85LOh9FX-5d2-Upzmv1m2ZmYxvD31TKpUTA@mail.gmail.com>
Message-ID: <CAHk-=whWoJhGeMn85LOh9FX-5d2-Upzmv1m2ZmYxvD31TKpUTA@mail.gmail.com>
To: Josef Bacik <josef@toxicpanda.com>
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
X-Mailman-Approved-At: Wed, 17 Mar 2021 07:00:38 -0400
Cc: Steve French <sfrench@samba.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>,
	linux-afs@lists.infradead.org, Linux-MM <linux-mm@kvack.org>,
	CIFS <linux-cifs@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@lst.de>, Chris Mason <clm@fb.com>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, David Sterba <dsterba@suse.com>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 02/28] mm: Add an unlock function for
	PG_private_2/PG_fscache
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

On Tue, Mar 16, 2021 at 7:12 PM Josef Bacik <josef@toxicpanda.com> wrote:
>
>
> Yeah it's just a flag, we use it to tell that the page is part of a range that
> has been allocated for IO.  The lifetime of the page is independent of the page,
> but is generally either dirty or under writeback, so either it goes through
> truncate and we clear PagePrivate2 there, or it actually goes through IO and is
> cleared before we drop the page in our endio.

Ok, that's what it looked like from my very limited "looking at a
couple of grep cases", but I didn't go any further than that.

> We _always_ have PG_private set on the page as long as we own it, and
> PG_private_2 is only set in this IO related context, so we're safe
> there because of the rules around PG_dirty/PG_writeback. We don't need
> it to have an extra ref for it being set.

Perfect. That means that at least as far as btrfs is concerned, we
could trivially remove PG_private_2 from that page_has_private() math
- you'd always see the same result anyway, exactly because you have
PG_private set.

And as far as I can tell, fscache doesn't want that PG_private_2 bit
to interact with the random VM lifetime or migration rules either, and
should rely entirely on the page count. David?

There's actually a fair number of page_has_private() users, so we'd
better make sure that's the case. But it's simplified by this but
really only being used by btrfs (which doesn't care) and fscache, so
this cleanup would basically be entirely up to the whole fscache
series.

Hmm? Objections?

            Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

