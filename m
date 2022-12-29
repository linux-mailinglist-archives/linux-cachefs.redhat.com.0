Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C6665EE8F
	for <lists+linux-cachefs@lfdr.de>; Thu,  5 Jan 2023 15:15:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672928105;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=fbaXIeGLwd4xdAeYuR4t8HbhS035csL97vKS5lUFlIg=;
	b=dgbsaPxaAdxha/89ZOxZ/yvX05Xh6uCW6APApIFzaB/22bhDYlCHAA+TrVl5O4sK4BQpr3
	JoaoPADKiPmhT+ktCP3BISmA8mWn1gHYfd9M8B7iK2sZcw8Qoha0F+pbLwBoI5xSDtmEdD
	KQIlXpITw94EGhMJpckUfP1KUOq3KZE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-RW0u2O8LOPGYVi_8I2MRqg-1; Thu, 05 Jan 2023 09:15:02 -0500
X-MC-Unique: RW0u2O8LOPGYVi_8I2MRqg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C07CC801779;
	Thu,  5 Jan 2023 14:15:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D038D2166B32;
	Thu,  5 Jan 2023 14:15:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 72F8B194658D;
	Thu,  5 Jan 2023 14:15:00 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 140571946587 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 29 Dec 2022 07:41:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B541C492B00; Thu, 29 Dec 2022 07:41:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE9C3492B01
 for <linux-cachefs@redhat.com>; Thu, 29 Dec 2022 07:41:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93D4485A588
 for <linux-cachefs@redhat.com>; Thu, 29 Dec 2022 07:41:35 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-46-4nlO_wYcMLmgM33uRthRTQ-1; Thu, 29 Dec 2022 02:41:33 -0500
X-MC-Unique: 4nlO_wYcMLmgM33uRthRTQ-1
Received: by mail-il1-f197.google.com with SMTP id
 h24-20020a056e021d9800b0030be8a5dd68so9987713ila.13
 for <linux-cachefs@redhat.com>; Wed, 28 Dec 2022 23:41:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7TQjimL8KUZMscO4m3fC34iqwHwmpZuK4STzqhRFKQI=;
 b=WmBuvbV0ub2PVp++psrnGeRkDwbAXzMWR1dCZxeKdi3aUwE4Yf9Qf6LTbszNETe4ua
 ZcDw4sAncoCgluKYmtaMO0AHQ/YSZt0M9n5hg+74lu/YCYD/e7JATiKJLR4akOTHjY7N
 VhyJdb5bJZH4Msk2iv1VdMtSfm1Qu5wPBkl0IDZeXVL1utVZQFjq1hqBO6KXCX298ifZ
 in6tRETjJhhOdABwp6oigoLoL2uyWObZ3xGV9jfdbzQPLDoVlEqIWgKO+HYwBxamx+TH
 7iCfBsfhGaWTZ1dJ2toRQb9zRME/Ybgy2XqaY7bc39a1MBMgEiNMlyZpnIJunWk/8vSX
 gFpg==
X-Gm-Message-State: AFqh2koYVO35pGKpmtQyrd6+Uq76wBRfceZ8qmwkk/qgrlBZHx6yjDqU
 YIAmpNOx3mpYxEU6ksi+QKzwJoDvaPuLFX6XiNQPLrZrtc0E
X-Google-Smtp-Source: AMrXdXuYLY6fqexLmgudj5C+fa2G61v4XrTcbiSl1xvdnHFrzt5G6uuSPBCL5pfEUBrWBTeNyMSoN5rgpur89PA6kEU6VrHQRqSJ
MIME-Version: 1.0
X-Received: by 2002:a92:dd8e:0:b0:30c:217:ddfa with SMTP id
 g14-20020a92dd8e000000b0030c0217ddfamr945881iln.148.1672299693017; Wed, 28
 Dec 2022 23:41:33 -0800 (PST)
Date: Wed, 28 Dec 2022 23:41:32 -0800
In-Reply-To: <000000000000f2b07b05d5dc87cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000029119905f0f29dd3@google.com>
From: syzbot <syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com>
To: dhowells@redhat.com, dvyukov@google.com, linux-cachefs-bounces@redhat.com, 
 linux-cachefs-owner@redhat.com, linux-cachefs@redhat.com, 
 linux-kernel@vger.kernel.org, mudongliangabcd@gmail.com, nogikh@google.com, 
 syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Thu, 05 Jan 2023 14:14:59 +0000
Subject: Re: [Linux-cachefs] [syzbot] general protection fault in
 fscache_free_cookie
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
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This bug is marked as fixed by commit:
fscache: fix GPF in fscache_free_cookie

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=5b129e8586277719bab3

---
[1] I expect the commit to be present in:

1. for-kernelci branch of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

2. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git

3. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git

4. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

The full list of 10 trees can be found at
https://syzkaller.appspot.com/upstream/repos

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

