Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB1B46F17B
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Dec 2021 18:18:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-FR-9tQzSPu-gSznnqAaTvw-1; Thu, 09 Dec 2021 12:18:49 -0500
X-MC-Unique: FR-9tQzSPu-gSznnqAaTvw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 160801F2E1;
	Thu,  9 Dec 2021 17:18:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0977C45D7A;
	Thu,  9 Dec 2021 17:18:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF2E14CA93;
	Thu,  9 Dec 2021 17:18:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B9HGYUa020885 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 9 Dec 2021 12:16:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A3F99400E127; Thu,  9 Dec 2021 17:16:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FDAA400F3F1
	for <linux-cachefs@redhat.com>; Thu,  9 Dec 2021 17:16:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8768729DD99D
	for <linux-cachefs@redhat.com>; Thu,  9 Dec 2021 17:16:34 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-385-cZhDyrKZPFyUhcigREDRZA-2; Thu, 09 Dec 2021 12:16:33 -0500
X-MC-Unique: cZhDyrKZPFyUhcigREDRZA-2
Received: by mail-ed1-f46.google.com with SMTP id x10so4517380edd.5
	for <linux-cachefs@redhat.com>; Thu, 09 Dec 2021 09:16:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3tHtN7G3YGgTFoTuLt2UtzoWso0slwegtyye0NyKD6E=;
	b=HvuoQ0ckUJ1mWX/4cXh+WaNdcGyvoD3+Lf5LXhlJkc/LI3wwqzUHPEhXP8cIfSj+tm
	9YEn+GIyck4OMs8LGHnj487nUuJ5s8Eix1jko+czKG6Uc9nnSp78L32WhraYgrQKZxnL
	KJoWkpxZqx83n8cP+hSwsI/HH0Q65vrclZfTobOeTrepUZyLGyxz6RZjQUNc0STrLCI6
	LpjOv+/QDd3ierNGPKxJiILviRLSVhx1OxrvS51OWvz2naQYOzNalTNpPypaIwfUmVWn
	puW6tO1JC3GIXqnGCOeKFRaQ//B4FAFEFmfX5bUxtjQd4BovWTH62Q+at3AtwoshyKsc
	Z1Cg==
X-Gm-Message-State: AOAM533nkfNe85v81CDellRdnWu+6c+hXpuRSTUdFjDoN7ykV4kwivYT
	+y64ozZudajyqBaSX3Kj7HH6DWjhC5aMBNFO
X-Google-Smtp-Source: ABdhPJxqPK3PfJ5azQi7zAOzdzS5Jl4qqXveRQAaHP98hC39fHHUeidiMoUM9Uu2KfeeUauppvdq+A==
X-Received: by 2002:a50:eb98:: with SMTP id y24mr31024359edr.339.1639069996933;
	Thu, 09 Dec 2021 09:13:16 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
	[209.85.128.44])
	by smtp.gmail.com with ESMTPSA id d10sm221606eja.4.2021.12.09.09.13.14
	for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 09 Dec 2021 09:13:15 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id o29so4795853wms.2
	for <linux-cachefs@redhat.com>; Thu, 09 Dec 2021 09:13:14 -0800 (PST)
X-Received: by 2002:a05:600c:1914:: with SMTP id
	j20mr8992229wmq.26.1639069994552; 
	Thu, 09 Dec 2021 09:13:14 -0800 (PST)
MIME-Version: 1.0
References: <163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
	<163906888735.143852.10944614318596881429.stgit@warthog.procyon.org.uk>
In-Reply-To: <163906888735.143852.10944614318596881429.stgit@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 9 Dec 2021 09:12:58 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiTquFUu-b5ME=rbGEF8r2Vh1TXGfaZZuXyOutVrgRzfw@mail.gmail.com>
Message-ID: <CAHk-=wiTquFUu-b5ME=rbGEF8r2Vh1TXGfaZZuXyOutVrgRzfw@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-cachefs@redhat.com
Cc: CIFS <linux-cifs@vger.kernel.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 9, 2021 at 8:54 AM David Howells <dhowells@redhat.com> wrote:
>
> Implement a function to generate hashes.  It needs to be stable over time
> and endianness-independent as the hashes will appear on disk in future
> patches.

I'm not actually seeing this being endianness-independent.

Is the input just regular 32-bit data in native word order? Because
then it's not endianness-independent, it's purely that there *is* no
endianness to the data at all and it is purely native data.

So the code may be correct, but the explanation is confusing. There is
absolutely nothing here that is about endianness.

           Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

