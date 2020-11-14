Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 905FC2B2DAF
	for <lists+linux-cachefs@lfdr.de>; Sat, 14 Nov 2020 15:42:25 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-CtbedCUsMkWFUoWJ06G3mg-1; Sat, 14 Nov 2020 09:42:22 -0500
X-MC-Unique: CtbedCUsMkWFUoWJ06G3mg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA919801FDF;
	Sat, 14 Nov 2020 14:42:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEA0E6EF40;
	Sat, 14 Nov 2020 14:42:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E459CF6C;
	Sat, 14 Nov 2020 14:42:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AEEgCjR000490 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 14 Nov 2020 09:42:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 65847200E20B; Sat, 14 Nov 2020 14:42:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F81E200E207
	for <linux-cachefs@redhat.com>; Sat, 14 Nov 2020 14:42:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13B688007DF
	for <linux-cachefs@redhat.com>; Sat, 14 Nov 2020 14:42:10 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-510-oXDXnBCJO66tlIUEQnyjIg-1; Sat, 14 Nov 2020 09:42:08 -0500
X-MC-Unique: oXDXnBCJO66tlIUEQnyjIg-1
Received: by mail-qv1-f68.google.com with SMTP id z17so6440505qvy.11
	for <linux-cachefs@redhat.com>; Sat, 14 Nov 2020 06:42:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/bFkAwvvqi3q0otrB3Dod9Fx9vaczXbmmZ2zfJ4oQKA=;
	b=ScKBLn6kPrR/cpIv1MVaRylVYqfr2ofoo8HPPCrzAqKI/X+ocBG7/74+uELGP6EiyX
	9OhojuQly/ZkZKBMep+Oawt0NaADB3j3/SAxyGBkP/p6/6B8cOEFa22Qo1gg9PoJlyO2
	r10pBshoJwFn8/NuQFxczcsx9TbCcPVHCuFYCF94PIACvtEigR2sAD56Xw7qD0wdsDw/
	nTcLCsxbz+QQffBrdvvLxzJom/wUymoLefIyMkcQKYa8iAdoBGgG24kYDJULh8AXwe4H
	yeFW49oXjOLNbrMACHqCU2/HAv4y6YuKqaZSRnsZUC660vf01B12dZyu+6vJQZg5Alh8
	h7qQ==
X-Gm-Message-State: AOAM531t0QoWHiTS59BI8itDlhOOa9bfwDSh2Y9KABNJVNs6pH+uZITD
	1WjDFZTImBKEpzaNCPTUl8M8jdf7av3+RFrU50gO4g==
X-Google-Smtp-Source: ABdhPJxk5r43DAmJDSrFhSpq4tpiJg2MdbsMie16Z4zaHsDKab8OWtliq094SlHS0Ys6gte+N9HLIjsIHgJCdThAoO8=
X-Received: by 2002:a0c:e911:: with SMTP id a17mr7558779qvo.18.1605364927202; 
	Sat, 14 Nov 2020 06:42:07 -0800 (PST)
MIME-Version: 1.0
References: <0000000000004740cd05ac444126@google.com>
	<00000000000005d94d05b4118980@google.com>
In-Reply-To: <00000000000005d94d05b4118980@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Sat, 14 Nov 2020 15:41:55 +0100
Message-ID: <CACT4Y+Ya+VbfXC6vn0cFJ0R6geg124vjxNzVo-g83iUV=gapdA@mail.gmail.com>
To: syzbot <syzbot+f59c67285cb61166a0cf@syzkaller.appspotmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: Hillf Danton <hdanton@sina.com>, Fox Chen <foxhlchen@gmail.com>,
	linux-cachefs-bounces@redhat.com,
	syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
	LKML <linux-kernel@vger.kernel.org>, linux-cachefs@redhat.com,
	Al Viro <viro@zeniv.linux.org.uk>, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] KASAN: use-after-free Write in afs_manage_cell
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Nov 14, 2020 at 2:58 PM syzbot
<syzbot+f59c67285cb61166a0cf@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 1d0e850a49a5b56f8f3cb51e74a11e2fedb96be6
> Author: David Howells <dhowells@redhat.com>
> Date:   Fri Oct 16 12:21:14 2020 +0000
>
>     afs: Fix cell removal
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15b78dba500000
> start commit:   da690031 Merge branch 'i2c/for-current' of git://git.kerne..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=de7f697da23057c7
> dashboard link: https://syzkaller.appspot.com/bug?extid=f59c67285cb61166a0cf
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10960a8b900000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17e938cf900000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: afs: Fix cell removal
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

#syz fix: afs: Fix cell removal

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

