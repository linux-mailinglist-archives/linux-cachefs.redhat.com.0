Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0364448BEB9
	for <lists+linux-cachefs@lfdr.de>; Wed, 12 Jan 2022 07:56:25 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-eqE7F155OMm8BmlXSU3Peg-1; Wed, 12 Jan 2022 01:56:22 -0500
X-MC-Unique: eqE7F155OMm8BmlXSU3Peg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B368181CCB4;
	Wed, 12 Jan 2022 06:56:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 440C85E4A2;
	Wed, 12 Jan 2022 06:56:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B3894BB7B;
	Wed, 12 Jan 2022 06:56:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20C6tTRo009524 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 01:55:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CCEC9202660C; Wed, 12 Jan 2022 06:55:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8457200BA61
	for <linux-cachefs@redhat.com>; Wed, 12 Jan 2022 06:55:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD188811E76
	for <linux-cachefs@redhat.com>; Wed, 12 Jan 2022 06:55:26 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-620-6JhZPnQ7O-a0uhEnxN1Y8g-1; Wed, 12 Jan 2022 01:55:23 -0500
X-MC-Unique: 6JhZPnQ7O-a0uhEnxN1Y8g-1
Received: by mail-ed1-f53.google.com with SMTP id k15so5767823edk.13;
	Tue, 11 Jan 2022 22:55:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vl5u6B/NkvNJJrH/cXFVPgO5CF7nm3Ynkvj2GDXNtJU=;
	b=NPiE+4FRa4CQB4kzFxO5wUPcdZ4w+UJELCVk2hsSGOozp5BdGoMNdRQwoFHzeAaiVt
	+EnOKeLycgCxhWMC3cBwaEy+Al6sQYZSKKBwy6NBNp4iPZiEq6IXkjv9mxgvgh2e0Nil
	O2NS3njHZlCvxQifoJgdo2EtKqTgAd1I2uQZIPMCxp0DI1kIp+ANDcujGj8FmE8PZf2c
	o7kvGZqQFk0jL8VvQMyUKk/wse+LzBIelSVMcaopxY0CVCkU5TnY/imA48fg5yU9AZ8r
	addBgjmwcR9dZCNLS37wGfXBw03y5rebJ5d+/CTTA0myAx0+SWYMfaSycivUOutok6dl
	POBQ==
X-Gm-Message-State: AOAM531EVU0FrigGWXgDla0eXN+9ZgpNIMofhenfMRsvRT8K65yEwThr
	wYyp7qYRLxzYQL9Kd/opSkKki4iEJjFtq23htBJTEFAPubw=
X-Google-Smtp-Source: ABdhPJw2dp4pENOTW0DM0T1kXaPoptToYEjJt7vxe6sneERB0ePQGEzsjNKYal8VGW1mNoMl9ygGt/t0o1rc6UVSIRE=
X-Received: by 2002:aa7:cac7:: with SMTP id l7mr7850424edt.302.1641970521816; 
	Tue, 11 Jan 2022 22:55:21 -0800 (PST)
MIME-Version: 1.0
References: <CADJHv_u3bqj82sFUWT=JJBWd1kjc14FUbVBd_9r18cMQOeudJw@mail.gmail.com>
	<CANT5p=rjTGNu2WooxRcu4JMM9wSyYY6S3kXtdfQ5caj1WnAEOA@mail.gmail.com>
	<CANT5p=pW1t5ggVsrMgNWi+CBpym5XXQ1dSwm-eH=vpczmL_nTg@mail.gmail.com>
	<CANT5p=oQeR90LPJKRUJ6eF+ti3Mefs48FfasT=fE79vyZKQU5g@mail.gmail.com>
	<CADJHv_s1-P20E=m+tWMYtWF-vJjcsEC3jq4Qd7seLxFJebgX2g@mail.gmail.com>
	<CADJHv_tfZRPtXqxTG-cnkXx=BQjq-danJQ0Q-rZZwS8PeCr_Eg@mail.gmail.com>
	<CANT5p=pdtZ0nNQYat6CJDqGQawiEnPAbST=1Q8JKs9GN9oA8nw@mail.gmail.com>
	<CADJHv_uZPY374k6vtbk2_VSC3YhejDT0fuuvyEJm6y2weqGLmg@mail.gmail.com>
	<3790640.1641819409@warthog.procyon.org.uk>
	<4126222.1641887321@warthog.procyon.org.uk>
	<20220111141305.56z36gaogt72kwja@xzhoux.usersys.redhat.com>
	<491547.1641939439@warthog.procyon.org.uk>
In-Reply-To: <491547.1641939439@warthog.procyon.org.uk>
From: Murphy Zhou <jencce.kernel@gmail.com>
Date: Wed, 12 Jan 2022 14:55:09 +0800
Message-ID: <CADJHv_uZe3UaO3Ei6vP1o5C2Pcasr6UCiiBvs7F_KV2731V0pQ@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, Steve French <smfrench@gmail.com>,
	linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [ linux-next ] 20211206 tree cifs panic
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 12, 2022 at 6:17 AM David Howells <dhowells@redhat.com> wrote:
>
> Can you try applying the attached patch?  It has some debugging to check that
> the cifs file it's trying to close actually got opened.  It turns out that
> some paths through were either managing to escape that or were going through
> when they shouldn't have been.

With this patch on 0111 tree, the panic is gone.

The panic looks like:

[   85.319031] Attempt to set a LOCK_MAND lock via flock(2). This
support has been removed and the request ignored.
[   85.320889] FS-Cache:
[   85.321265] FS-Cache: Assertion failed
[   85.321763] FS-Cache: ffffffffffffffff == 0 is false
[   85.322740] ------------[ cut here ]------------
[   85.323508] kernel BUG at fs/fscache/cookie.c:957!
[   85.324439] invalid opcode: 0000 [#1] PREEMPT SMP PTI
[   85.325266] CPU: 0 PID: 7 Comm: kworker/0:1 Not tainted
5.16.0-next-20220107-next-20220107 #1
[   85.326672] Hardware name: Red Hat KVM/RHEL-AV, BIOS 1.15.0-1.el9 04/01/2014
[   85.327830] Workqueue: deferredclose smb2_deferred_work_close [cifs]
[   85.328975] RIP: 0010:__fscache_relinquish_cookie.cold+0x2a/0x5c [fscache]
[   85.330214] Code: 48 c7 c7 bd 63 c7 c0 e8 ff ed 20 d5 48 c7 c7 cb
63 c7 c0 e8 f3 ed 20 d5 48 63 75 04 31 d2 48 c7 c7 d8 70 c7 c0 e8 e1
ed 20 d5 <0f> 0b 48 c7 c7 bd 63 c7 c0 e8 d3 ed 20 d5 48 c7 c7 cb 63 c7
c0 e8
[   85.333222] RSP: 0018:ffffac8b00043d40 EFLAGS: 00010246
[   85.334070] RAX: 0000000000000028 RBX: ffff900ac2954d88 RCX: 0000000000000000
[   85.335230] RDX: 0000000000000000 RSI: ffff900b3dc1fcc0 RDI: ffff900b3dc1fcc0
[   85.336388] RBP: ffff900addd19370 R08: 0000000000000000 R09: ffffac8b00043b88
[   85.337587] R10: ffffac8b00043b80 R11: ffffffff971e5a68 R12: ffff900ac2954cf8
[   85.338808] R13: ffff900ac367b000 R14: 000000000000001a R15: ffff900b0d5e7a00
[   85.339333] FS-Cache:
[   85.339969] FS:  0000000000000000(0000) GS:ffff900b3dc00000(0000)
knlGS:0000000000000000
[   85.340333] FS-Cache: Assertion failed
[   85.341652] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   85.341654] CR2: 00007f364bb6cf18 CR3: 0000000002202006 CR4: 0000000000170ef0
[   85.341657] Call Trace:
[   85.341660]  <TASK>
[   85.342161] FS-Cache: ffffffffffffffff == 0 is false
[   85.343111]  cifs_fscache_release_inode_cookie+0x22/0x80 [cifs]
[   85.344035] ------------[ cut here ]------------
[   85.344443]  cifsFileInfo_put_final+0x39/0x150 [cifs]
[   85.344731] kernel BUG at fs/fscache/cookie.c:957!
[   85.345570]  _cifsFileInfo_put+0x23d/0x3e0 [cifs]
[   85.349557]  ? smb2_deferred_work_close+0x30/0x60 [cifs]
[   85.350466]  process_one_work+0x1e5/0x3b0
[   85.351745]  worker_thread+0x50/0x3a0
[   85.352929]  ? rescuer_thread+0x370/0x370
[   85.354218]  kthread+0xca/0xf0
[   85.355309]  ? kthread_complete_and_exit+0x20/0x20
[   85.356644]  ret_from_fork+0x22/0x30
[   85.357853]  </TASK>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

