Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0C84898EA
	for <lists+linux-cachefs@lfdr.de>; Mon, 10 Jan 2022 13:57:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641819431;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7s1VghaDoRHqwCvcu6vbjot+qc7GExty/2lfGsXf3yA=;
	b=TtnHJ/1Tuo2xCUJ3bbm8fFlWobpllTu5EZH0mi6QVKTu5SZqQCzsy7MvjLe2oBRgDGIrLe
	ZxBDoKKM5d/h/B4FL9qQs+xoXLr6delGBhtwyRus3sq4k3yst2YMa+7ZYOZjDZUIqdgJX2
	7mT3ZXztRA8CXv7U6738GlcfGepvsIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-oTCshAgoOiCILDyAenW5hw-1; Mon, 10 Jan 2022 07:57:08 -0500
X-MC-Unique: oTCshAgoOiCILDyAenW5hw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 446B2835B91;
	Mon, 10 Jan 2022 12:57:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A4B184A15;
	Mon, 10 Jan 2022 12:57:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A22C4BB7C;
	Mon, 10 Jan 2022 12:57:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20ACv01m004059 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 10 Jan 2022 07:57:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E0DC010001AF; Mon, 10 Jan 2022 12:57:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22AAE105B216;
	Mon, 10 Jan 2022 12:56:50 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <3737560.1641815458@warthog.procyon.org.uk>
References: <3737560.1641815458@warthog.procyon.org.uk>
	<20220110052313.ax6ory7xaevbttoe@xzhoux.usersys.redhat.com>
	<CADJHv_u3bqj82sFUWT=JJBWd1kjc14FUbVBd_9r18cMQOeudJw@mail.gmail.com>
	<CANT5p=rjTGNu2WooxRcu4JMM9wSyYY6S3kXtdfQ5caj1WnAEOA@mail.gmail.com>
	<CANT5p=pW1t5ggVsrMgNWi+CBpym5XXQ1dSwm-eH=vpczmL_nTg@mail.gmail.com>
	<CANT5p=oQeR90LPJKRUJ6eF+ti3Mefs48FfasT=fE79vyZKQU5g@mail.gmail.com>
	<CADJHv_s1-P20E=m+tWMYtWF-vJjcsEC3jq4Qd7seLxFJebgX2g@mail.gmail.com>
	<CADJHv_tfZRPtXqxTG-cnkXx=BQjq-danJQ0Q-rZZwS8PeCr_Eg@mail.gmail.com>
	<CANT5p=pdtZ0nNQYat6CJDqGQawiEnPAbST=1Q8JKs9GN9oA8nw@mail.gmail.com>
	<CADJHv_uZPY374k6vtbk2_VSC3YhejDT0fuuvyEJm6y2weqGLmg@mail.gmail.com>
To: Murphy Zhou <jencce.kernel@gmail.com>
MIME-Version: 1.0
Date: Mon, 10 Jan 2022 12:56:49 +0000
Message-ID: <3790640.1641819409@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 20ACv01m004059
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cachefs@redhat.com,
	Steve French <smfrench@gmail.com>
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
Content-ID: <3790639.1641819409.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Howells <dhowells@redhat.com> wrote:

> > It's still reproducible on the latest next-20210107 tree with below
> > reproducer.
> 
> If you meant next-20220107 then that's using the v4 version of the patches;
> there is a v5, though I've only posted an updated cifs patch, that is in
> next-20220110.  I'm not sure if it would help, though.

I managed to set up and run cthon04.  I can confirm that it throws out lots of
oopses with fscache-rewrite-v4 (see below for an example of such):

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/tag/?h=fscache-rewrite-v4

but seems to work fine with v5:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-rewrite

both with and without a cache attached.

David
---
CIFS: Attempting to mount \\carina\shares
FS-Cache: 
FS-Cache: Assertion failed
FS-Cache: 
FS-Cache: ffffffffffffffff == 0 is false
FS-Cache: Assertion failed
FS-Cache: 
FS-Cache: Assertion failed
FS-Cache: ffffffffffffffff == 0 is false
------------[ cut here ]------------
kernel BUG at fs/fscache/cookie.c:957!
invalid opcode: 0000 [#1] PREEMPT SMP PTI
CPU: 3 PID: 1063 Comm: kworker/3:2 Not tainted 5.16.0-rc4-build3+ #5143
Hardware name: ASUS All Series/H97-PLUS, BIOS 2306 10/09/2014
Workqueue: deferredclose smb2_deferred_work_close
RIP: 0010:__fscache_relinquish_cookie+0x112/0x1a3
Code: 48 c7 c7 8b d4 41 82 e8 3d 7f 78 00 48 c7 c7 99 d4 41 82 e8 31 7f 78 00 48 63 75 04 31 d2 48 c7 c7 4b d7 41 82 e8 1f 7f 78 00 <0f> 0b 48 8b 45 30 8b 50 04
 85 d2 7f 30 48 c7 c7 8b d4 41 82 e8 06
RSP: 0018:ffff8881064b3d50 EFLAGS: 00010246
RAX: 0000000000000028 RBX: 0000000000000000 RCX: 0000000000000027
RDX: 0000000000000000 RSI: ffffffff824691ad RDI: 00000000ffffffff
RBP: ffff888112c6baf0 R08: 0000000000000033 R09: 0000000000000002
R10: 000000000000000f R11: ffffffff82dfb321 R12: ffff888112c6bb90
R13: ffff8881188814f0 R14: ffff888106e4d800 R15: ffff888118881540
FS:  0000000000000000(0000) GS:ffff88840fb80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055d6057aed30 CR3: 000000000260c004 CR4: 00000000001706e0
Call Trace:
 <TASK>
 cifs_fscache_release_inode_cookie+0x19/0x23
 cifsFileInfo_put_final+0x2e/0xb5
 _cifsFileInfo_put+0x26a/0x291
 ? get_sd_balance_interval+0x18/0x3b
 ? _raw_spin_unlock+0x14/0x25
 ? raw_spin_rq_unlock_irq+0x9/0xc
 ? smb2_deferred_work_close+0x30/0x5c
 ? kfree+0x9b/0xa9
 process_one_work+0x170/0x25e
 worker_thread+0x172/0x233
 ? rescuer_thread+0x283/0x283
 kthread+0x12f/0x137
 ? set_kthread_struct+0x32/0x32
 ret_from_fork+0x1f/0x30
 </TASK>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

