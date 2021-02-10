Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 30CCB3171AD
	for <lists+linux-cachefs@lfdr.de>; Wed, 10 Feb 2021 21:50:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-_M1biLrSNIarmkd4dWhDDQ-1; Wed, 10 Feb 2021 15:50:41 -0500
X-MC-Unique: _M1biLrSNIarmkd4dWhDDQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0E7E80402E;
	Wed, 10 Feb 2021 20:50:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2F7F5C1BD;
	Wed, 10 Feb 2021 20:50:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE1A218095C9;
	Wed, 10 Feb 2021 20:50:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11AKoUxK014181 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 10 Feb 2021 15:50:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 805471019269; Wed, 10 Feb 2021 20:50:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B74310FFE6D
	for <linux-cachefs@redhat.com>; Wed, 10 Feb 2021 20:50:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D2E0101A53A
	for <linux-cachefs@redhat.com>; Wed, 10 Feb 2021 20:50:26 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-44-8W5heE4pPLqfDDro_hvqbA-1; Wed, 10 Feb 2021 15:50:24 -0500
X-MC-Unique: 8W5heE4pPLqfDDro_hvqbA-1
Received: by mail-lj1-f182.google.com with SMTP id a17so4726897ljq.2
	for <linux-cachefs@redhat.com>; Wed, 10 Feb 2021 12:50:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bFCBVLmx4m3P8OJ7FexI4xTU+D+dqeOPB5L3zdP1j98=;
	b=eqa7xQPAMOgZNq1x/uuRVwZEVupc6WuLd1keP/NxPnVHX1lTOPg7H1bnCmIOn/z45C
	RRxm9lR8KTPG9QP+7ME+oqzNq02lzbFz31NGgbLHfYZCsB4jj+G4WJMxjQu4+V9wqxrv
	MLendPK6UfOPNCZk5GDxD5+161yadjDLnm3c1UoQAnOKaxNZFmROvaOJ5v4JQBcl9bDh
	hTyF3EV5xgxVbwGfDdBdAhxHV51GP7d7TISbLcy9FR1Y5XdYtqH5RDA/1UaXpKMBj1KO
	zuGcoaLToH//FX4U+e8tAlHMg9+gfodrxv7/7S8sWACeBVdK9nrJtEkX0g02+e7EvjPr
	3FrQ==
X-Gm-Message-State: AOAM533+AzCzRh45jqBXIvk+/inL5Nt/R3nL8GgVW/BT63NEfHn59h1u
	cJo7KudMlvThOLTQv5UrUiqEU112rFGZDQ==
X-Google-Smtp-Source: ABdhPJzNtaP3dPaT0hgKupNQ/ldPDB8yQMCYs5sKBy0mKuK3XTqGLjfrcxImreZVELVP8UMHhL9N/A==
X-Received: by 2002:a2e:86c1:: with SMTP id n1mr2968763ljj.148.1612990222699; 
	Wed, 10 Feb 2021 12:50:22 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
	[209.85.167.49])
	by smtp.gmail.com with ESMTPSA id b5sm450290lfi.3.2021.02.10.12.50.21
	for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 10 Feb 2021 12:50:22 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id f23so4889199lfk.9
	for <linux-cachefs@redhat.com>; Wed, 10 Feb 2021 12:50:21 -0800 (PST)
X-Received: by 2002:a05:6512:a8c:: with SMTP id
	m12mr2551518lfu.253.1612989815438; 
	Wed, 10 Feb 2021 12:43:35 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wj-k86FOqAVQ4ScnBkX3YEKuMzqTEB2vixdHgovJpHc9w@mail.gmail.com>
	<591237.1612886997@warthog.procyon.org.uk>
	<1330473.1612974547@warthog.procyon.org.uk>
	<1330751.1612974783@warthog.procyon.org.uk>
In-Reply-To: <1330751.1612974783@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 10 Feb 2021 12:43:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjgA-74ddehziVk=XAEMTKswPu1Yw4uaro1R3ibs27ztw@mail.gmail.com>
Message-ID: <CAHk-=wjgA-74ddehziVk=XAEMTKswPu1Yw4uaro1R3ibs27ztw@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: CIFS <linux-cifs@vger.kernel.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Subject: Re: [Linux-cachefs] [GIT PULL] fscache: I/O API modernisation and
	netfs helper library
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 10, 2021 at 8:33 AM David Howells <dhowells@redhat.com> wrote:
>
> Then I could follow it up with this patch here, moving towards dropping the
> PG_fscache alias for the new API.

So I don't mind the alias per se, but I did mind the odd mixing of
names for the same thing.

So I think your change to make it be named "wait_on_page_private_2()"
fixed that mixing, but I also think that it's probably then a good
idea to have aliases in place for filesystems that actually include
the fscache.h header.

Put another way: I think that it would be even better to simply just
have a function like

   static inline void wait_on_page_fscache(struct page *page)
   {
        if (PagePrivate2(page))
                wait_on_page_bit(page, PG_private_2);
  }

and make that be *not* in <linux/pagemap.h>, but simply be in
<linux/fscache.h> under that big comment about how PG_private_2 is
used for the fscache bit. You already have that comment, putting the
above kind of helper function right there would very much explain why
a "wait for fscache bit" function then uses the PagePrivate2 function
to test the bit. Agreed?

Alternatively, since that header file already has

    #define PageFsCache(page)               PagePrivate2((page))

you could also just write the above as

   static inline void wait_on_page_fscache(struct page *page)
   {
        if (PageFsCache(page))
                wait_on_page_bit(page, PG_fscache);
  }

and now it is even more obvious. And there's no odd mixing of
"fscache" and "private_2", it's all consistent.

IOW, I'm not against "wait_on_page_fscache()" as a function, but I
*am* against the odd _mixing_ of things without a big explanation,
where the code itself looks very odd and questionable.

And I think the "fscache" waiting functions should not be visible to
any core VM or filesystem code - it should be limited explicitly to
those filesystems that use fscache, and include that header file.

Wouldn't that make sense?

Also, honestly, I really *REALLY* want your commit messages to talk
about who has been cc'd, who has been part of development, and point
to the PUBLIC MAILING LISTS WHERE THAT DISCUSSION WAS TAKING PLACE, so
that I can actually see that "yes, other people were involved"

No, I don't require this in general, but exactly because of the
history we have, I really really want to see that. I want to see a

   Link: https://lore.kernel.org/r/....

and the Cc's - or better yet, the Reviewed-by's etc - so that when I
get a pull request, it really is very obvious to me when I look at it
that others really have been involved.

So if I continue to see just

    Signed-off-by: David Howells <dhowells@redhat.com>

at the end of the commit messages, I will not pull.

Yes, in this thread a couple of people have piped up and said that
they were part of the discussion and that they are interested, but if
I have to start asking around just to see that, then it's too little,
too late.

No more of this "it looks like David Howells did things in private". I
want links I can follow to see the discussion, and I really want to
see that others really have been involved.

Ok?

                  Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

