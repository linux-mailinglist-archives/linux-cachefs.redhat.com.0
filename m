Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A7C4C84DC
	for <lists+linux-cachefs@lfdr.de>; Tue,  1 Mar 2022 08:23:10 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-o4A30LVIOLO6cp9_4IJ40Q-1; Tue, 01 Mar 2022 02:23:06 -0500
X-MC-Unique: o4A30LVIOLO6cp9_4IJ40Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77E988464BB;
	Tue,  1 Mar 2022 07:23:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 191DE5DBBA;
	Tue,  1 Mar 2022 07:23:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58F5744A5A;
	Tue,  1 Mar 2022 07:23:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 2217Ljuu022795 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 1 Mar 2022 02:21:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 937FF141DC2C; Tue,  1 Mar 2022 07:21:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F9611400E74
	for <linux-cachefs@redhat.com>; Tue,  1 Mar 2022 07:21:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76BD3101AA45
	for <linux-cachefs@redhat.com>; Tue,  1 Mar 2022 07:21:45 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
	[209.85.221.175]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-487-v2JEBnR7ONqreAZ7enNsMA-1; Tue, 01 Mar 2022 02:21:42 -0500
X-MC-Unique: v2JEBnR7ONqreAZ7enNsMA-1
Received: by mail-vk1-f175.google.com with SMTP id bj24so6396635vkb.8;
	Mon, 28 Feb 2022 23:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yIhHbRiRsE369Y60O9So9Za6xEeWordfQYdXDUDiS1Y=;
	b=Vb/v1NN7I7tr3NoFXXteSEejQgdwuL4LKpVwiRqf8GCZWb2JU8YadKxd49GARNBZHr
	XCgAu/0TiztCVSG8sxv51Td303g+p5lFbPYT/Omd7Nl2Vt2biDTyw5yU3K+9oeafBxDk
	/KLh5+pr8/OxT3ImcmUCSsnOvp1J4gmyacPcakHBCiWXdWC+qGavPDPrlgdJRmUGQVUM
	F2RsKrXF83g5vxdJkai0nTRKO9KFc6XaNGEU8JlLMlkSRY8v50asNezgayDBCd7ghrtM
	QLwr8OoKa3TT7A+X2MPr5h6yptwROl+MB2b/runvRtTjfS4X1tVzKHg1AbX0u2cVqEeG
	k1NQ==
X-Gm-Message-State: AOAM532IDVw1u5rua6Sxr/kvv70fUL9lHsKA0xEEbwAzUjs22RviopkK
	G1z4d1KmkvE0LkDAKs6duur8ZwWijSttNLaNXacVb5ipFrY=
X-Google-Smtp-Source: ABdhPJx0f65q+nbNuz6F41AtV0+nlc6GVfOsX//5scKABZG+GDQ9u09qk04s4wFA4zwiR2OuLu9yu8wiED3Gqg9mXj0=
X-Received: by 2002:a05:6122:d04:b0:333:318c:1460 with SMTP id
	az4-20020a0561220d0400b00333318c1460mr4177721vkb.41.1646119301238;
	Mon, 28 Feb 2022 23:21:41 -0800 (PST)
MIME-Version: 1.0
References: <164311902471.2806745.10187041199819525677.stgit@warthog.procyon.org.uk>
	<164311919732.2806745.2743328800847071763.stgit@warthog.procyon.org.uk>
	<CACdtm0YtxAUMet_PSxpg69OR9_TQbMQOzU5Kbm_5YDe_C7Nb-w@mail.gmail.com>
	<3013921.1644856403@warthog.procyon.org.uk>
	<CACdtm0Z4zXpbPBLJx-=AgBRd63hp_n+U-5qc0gQDQW0c2PY7gg@mail.gmail.com>
	<2498968.1646058507@warthog.procyon.org.uk>
In-Reply-To: <2498968.1646058507@warthog.procyon.org.uk>
From: Rohith Surabattula <rohiths.msft@gmail.com>
Date: Tue, 1 Mar 2022 12:51:30 +0530
Message-ID: <CACdtm0aZnQLyduKxr9dhcpYB_r00UFnR=WQvAnqL0DebxgbrOw@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: linux-cachefs@redhat.com
Cc: nspmangalore@gmail.com, linux-cifs@vger.kernel.org, jlayton@kernel.org,
	smfrench@gmail.com, linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org
Subject: Re: [Linux-cachefs] [RFC PATCH 7/7] cifs: Use netfslib to handle
	reads
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

Hi David,

Below are traces:
              vi-9189    [001] ..... 64454.731493: fscache_acquire:
c=0000001f V=00000001 vr=31 vc=30
              vi-9189    [001] ..... 64454.739242: fscache_acquire:
c=00000020 V=00000001 vr=32 vc=31
              vi-9189    [001] ..... 64454.783474: fscache_acquire:
c=00000021 V=00000001 vr=33 vc=32
              vi-9189    [001] ..... 64454.794650: netfs_read:
R=00000007 READAHEAD c=00000000 ni=0 s=0 1000
              vi-9189    [001] ..... 64454.794652: netfs_read:
R=00000007 EXPANDED  c=00000000 ni=0 s=0 1000
              vi-9189    [001] ..... 64454.794661: netfs_sreq:
R=00000007[0] PREP  DOWN f=00 s=0 0/100000 e=0
              vi-9189    [001] ..... 64454.794662: netfs_sreq:
R=00000007[0] SUBMT DOWN f=00 s=0 0/100000 e=0
           cifsd-1390    [000] ..... 64454.817450: netfs_sreq:
R=00000007[0] TERM  DOWN f=02 s=0 100000/100000 e=0
           cifsd-1390    [000] ..... 64454.817451: netfs_rreq:
R=00000007 ASSESS f=20
           cifsd-1390    [000] ..... 64454.817452: netfs_rreq:
R=00000007 UNLOCK f=20
           cifsd-1390    [000] ..... 64454.817464: netfs_rreq:
R=00000007 DONE   f=00
           cifsd-1390    [000] ..... 64454.817464: netfs_sreq:
R=00000007[0] FREE  DOWN f=02 s=0 100000/100000 e=0
           cifsd-1390    [000] ..... 64454.817465: netfs_rreq:
R=00000007 FREE   f=00

Regards,
Rohith

On Mon, Feb 28, 2022 at 7:58 PM David Howells <dhowells@redhat.com> wrote:
>
> Rohith Surabattula <rohiths.msft@gmail.com> wrote:
>
> > R=00000006 READAHEAD c=00000000 ni=0 s=0 1000
> >               vi-1631    [000] .....  2519.247540: netfs_read:
>
> "c=00000000" would indicate that no fscache cookie was allocated for this
> inode.
>
> > COOKIE   VOLUME   REF ACT ACC S FL DEF
> > ======== ======== === === === = == ================
> > 00000002 00000001   1   0   0 - 4008 302559bec76a7924,
> > 0a13e961000000000a13e96100000000d01f4719d01f4719
> > 00000003 00000001   1   0   0 - 4000 0000000000640090,
> > 37630162000000003763016200000000e8650f119c49f411
>
> But we can see some cookies have been allocated.
>
> Can you turn on:
>
>   echo 1 >/sys/kernel/debug/tracing/events/fscache/fscache_acquire/enable
>
> David
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

