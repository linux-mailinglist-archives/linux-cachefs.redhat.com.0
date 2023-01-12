Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 797BA66D2E1
	for <lists+linux-cachefs@lfdr.de>; Tue, 17 Jan 2023 00:15:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673910942;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=fbaXIeGLwd4xdAeYuR4t8HbhS035csL97vKS5lUFlIg=;
	b=DN0bB+D0vf7ehWKmEjzVB5TNpEiE7L51hNRl1XhfL0s1CFLLFzCk2vuIwkfobz5nflZ59H
	R2LfurB/9t6Rh8V/eTRR/30QCZi56hD/KU1R0+uVnW2p4VLWDtowcK2HSfKYsrqyXMyfFT
	pqq8Um1EvmcEFFckjdLhK0vbJCLFv5I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-cSTLgFgwMqiVEw43ECWtSw-1; Mon, 16 Jan 2023 18:15:38 -0500
X-MC-Unique: cSTLgFgwMqiVEw43ECWtSw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CA8B1C0432A;
	Mon, 16 Jan 2023 23:15:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42D5439D92;
	Mon, 16 Jan 2023 23:15:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9DC1C1946595;
	Mon, 16 Jan 2023 23:15:37 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AAAD81946A78 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 12 Jan 2023 07:42:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 994CB492C1B; Thu, 12 Jan 2023 07:42:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91CCE492C18
 for <linux-cachefs@redhat.com>; Thu, 12 Jan 2023 07:42:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76B9338041EB
 for <linux-cachefs@redhat.com>; Thu, 12 Jan 2023 07:42:29 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-326-oUlPBS77MFW087zR9S5rmg-1; Thu, 12 Jan 2023 02:42:27 -0500
X-MC-Unique: oUlPBS77MFW087zR9S5rmg-1
Received: by mail-il1-f199.google.com with SMTP id
 i14-20020a056e020d8e00b003034b93bd07so12795912ilj.14
 for <linux-cachefs@redhat.com>; Wed, 11 Jan 2023 23:42:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7TQjimL8KUZMscO4m3fC34iqwHwmpZuK4STzqhRFKQI=;
 b=Xgm7wfGlP19fluEb4AMbdQ+LRqz8QrCjysr73JRgHQmeZCo+w0KfWALOr0DJTjHk3F
 rZqTwufd4nBHfhk7WUYCfnRON0mKzUnx2TJeAz2mI57HjpnnkYXy8DOBV4fxkb8J+cLh
 5HTeFJztj4sFP+oqn9ixZ4VoGNPxS+OLI9ZE3ForWLE0guENUgayH5R1JxsrMJfbg71r
 UTZ34cBNnwLzjGyZQdwUzuPOz3DkBfvlCYYpBMeg8VDxGVkMUbuSrGhvIEutNw7U5yz8
 oslbgDziosGmOgfhdn0cJxrEVtpWfU3mVHpyFemk1ixvvkTYiy84pzZ8PfMDrvBXXLjC
 8XFg==
X-Gm-Message-State: AFqh2koACsWPRMfTp2VWWsiquSUPJOCmDSBNHoE3J6WOfqN1UmTizjJg
 o+ozd42yEVlq+ZNvIVFeBr/DiSIoBJfV+0bIJQZ1CDyZx1Fm
X-Google-Smtp-Source: AMrXdXsKCZePNVlRHn4wtr1s76eeempx4mtvAQfxz/sKaVwwejEpSYE+q3rdDiIZupgUnQIkmsWPf8BVsPx8vxngPT+fX5VHKlvE
MIME-Version: 1.0
X-Received: by 2002:a92:4402:0:b0:30d:90de:eb8e with SMTP id
 r2-20020a924402000000b0030d90deeb8emr2414568ila.204.1673509345955; Wed, 11
 Jan 2023 23:42:25 -0800 (PST)
Date: Wed, 11 Jan 2023 23:42:25 -0800
In-Reply-To: <000000000000f2b07b05d5dc87cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000018186f05f20c420c@google.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Mon, 16 Jan 2023 23:15:36 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

