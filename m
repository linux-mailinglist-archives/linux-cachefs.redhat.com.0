Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3DF5477E3
	for <lists+linux-cachefs@lfdr.de>; Sun, 12 Jun 2022 01:17:12 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-8OXKTYXqPHWa5gXxO-TxJA-1; Sat, 11 Jun 2022 19:17:09 -0400
X-MC-Unique: 8OXKTYXqPHWa5gXxO-TxJA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B04F3804532;
	Sat, 11 Jun 2022 23:17:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4AA3C44AE3;
	Sat, 11 Jun 2022 23:17:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 43856194705E;
	Sat, 11 Jun 2022 23:17:07 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 09F3F1947054 for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 11 Jun 2022 23:17:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DC63640E80E1; Sat, 11 Jun 2022 23:17:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7EE640E80E0
 for <linux-cachefs@redhat.com>; Sat, 11 Jun 2022 23:17:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFCD03C0D183
 for <linux-cachefs@redhat.com>; Sat, 11 Jun 2022 23:17:05 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-HcR8yheRMtOU4UPsQr0jIA-1; Sat, 11 Jun 2022 19:16:58 -0400
X-MC-Unique: HcR8yheRMtOU4UPsQr0jIA-1
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-30fa61b1a83so22045877b3.0; 
 Sat, 11 Jun 2022 16:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7tY0AdLKGQcBZThRCKqEnHHKhqjAUktylGqxkcbwV5M=;
 b=QkQ06cg6XBZQ2TJVZJugxMC09Q0syOkgHj5uETKUn4oMV4zTtOWmrFiVNMeMYG8Qbu
 ltadrnuwqCIfd2LElc0JxeZqciFKCQMh17/JSsOydo2r2rPO9TjFV8BPetY0K17qYsAv
 iHTQ7BFN5VTds9SMNSUqFq24rvNTmg6rKXLWY/fktd4OvErKq6r090y11hmX9s0UtCxU
 cCe/y2JAc0GZSgWtqwIu1ZUtW28G/UddXqHAIMs/PrCe82xGgiMaO/fp5mf61PIfdy28
 ISRaLJo2cI5AnbY9cI6E4v03h1DLJ7qveBtOBBvH2t75/Z9HECiH3TBoo9XJ3DKCe1zm
 b0Hg==
X-Gm-Message-State: AOAM532wAM/APHy6IPx9qxnW2YXxwFy9Xexjckca3LceDZpqd69B5vlI
 v1bJCKnVVVNX2jcNdu4ROpbw7Ho8aIOIYgYylyw=
X-Google-Smtp-Source: ABdhPJzlwYpvKTPyyPdeXtV2pl9MFSrG58VQNbCZMgzIM4+A3xkdjLHgnk9bXvveXs22MFjk8SlQTB1IJrT1XFksgVA=
X-Received: by 2002:a81:25cc:0:b0:30f:ea57:af01 with SMTP id
 l195-20020a8125cc000000b0030fea57af01mr54129487ywl.488.1654989417608; Sat, 11
 Jun 2022 16:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <YqRyL2sIqQNDfky2@debian> <YqSGv6uaZzLxKfmG@zeniv-ca.linux.org.uk>
 <YqSMmC/UuQpXdxtR@zeniv-ca.linux.org.uk>
 <YqSQ++8UnEW0AJ2y@zeniv-ca.linux.org.uk>
In-Reply-To: <YqSQ++8UnEW0AJ2y@zeniv-ca.linux.org.uk>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sun, 12 Jun 2022 00:16:21 +0100
Message-ID: <CADVatmOJvTj21vrL5cnAVjWx46cB4r_kB+T2ankDj+mKH2-7=w@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Linux-cachefs] mainline build failure due to 6c77676645ad
 ("iov_iter: Fix iter_xarray_get_pages{, _alloc}()")
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Gao Xiang <xiang@kernel.org>, linux-erofs@lists.ozlabs.org,
 linux-afs@lists.infradead.org, devel@lists.orangefs.org,
 Mike Marshall <hubcap@omnibond.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jun 11, 2022 at 1:56 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Sat, Jun 11, 2022 at 12:37:44PM +0000, Al Viro wrote:
> > On Sat, Jun 11, 2022 at 12:12:47PM +0000, Al Viro wrote:
> >
> >
> > > At a guess, should be
> > >     return min((size_t)nr * PAGE_SIZE - offset, maxsize);
> > >
> > > in both places.  I'm more than half-asleep right now; could you verify that it
> > > (as the last lines of both iter_xarray_get_pages() and iter_xarray_get_pages_alloc())
> > > builds correctly?
> >
> > No, I'm misreading it - it's unsigned * unsigned long - unsigned vs. size_t.
> > On arm it ends up with unsigned long vs. unsigned int; functionally it *is*
> > OK (both have the same range there), but it triggers the tests.  Try
> >
> >       return min_t(size_t, nr * PAGE_SIZE - offset, maxsize);
> >
> > there (both places).
>
> The reason we can't overflow on multiplication there, BTW, is that we have
> nr <= count, and count has come from weirdly open-coded
>         DIV_ROUND_UP(size + offset, PAGE_SIZE)
> IMO we'd better make it explicit, so how about the following:

Thanks. Fixed the build for me.


-- 
Regards
Sudip

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

