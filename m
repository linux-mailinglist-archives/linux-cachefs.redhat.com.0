Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D1A695FB3
	for <lists+linux-cachefs@lfdr.de>; Tue, 14 Feb 2023 10:49:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676368166;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=fbaXIeGLwd4xdAeYuR4t8HbhS035csL97vKS5lUFlIg=;
	b=KBcj205tSeL1Yp8K7im62FAkPpdweAiImpodL30LYRd2LrLOAfuX2kUv1h56D84AkjWPIz
	SG86tOMfyXmvhY1EmS2MhcNpMShb3j5y87Vqnv2Wcn7pNZ/YPp9YyppT/8lw697lo2LqsA
	BgXqnJRdAlDS2RwfiZ+QNFybXIko1/o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-bK8-bWX8P723v9MhGkHfQA-1; Tue, 14 Feb 2023 04:49:25 -0500
X-MC-Unique: bK8-bWX8P723v9MhGkHfQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF7D180D0EA;
	Tue, 14 Feb 2023 09:49:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E97341121318;
	Tue, 14 Feb 2023 09:49:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 577281946595;
	Tue, 14 Feb 2023 09:49:17 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1A0461946589 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  9 Feb 2023 07:44:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0253B2026D76; Thu,  9 Feb 2023 07:44:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EDEA62026D4B
 for <linux-cachefs@redhat.com>; Thu,  9 Feb 2023 07:44:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDD653C01DEA
 for <linux-cachefs@redhat.com>; Thu,  9 Feb 2023 07:44:35 +0000 (UTC)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-a1V2pI2IPPeelDZupO3eWw-1; Thu, 09 Feb 2023 02:44:34 -0500
X-MC-Unique: a1V2pI2IPPeelDZupO3eWw-1
Received: by mail-il1-f200.google.com with SMTP id
 s12-20020a056e021a0c00b0030efd0ed890so1088514ild.7
 for <linux-cachefs@redhat.com>; Wed, 08 Feb 2023 23:44:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7TQjimL8KUZMscO4m3fC34iqwHwmpZuK4STzqhRFKQI=;
 b=boQDw3709WArqTO9cvlVKokDrnguMktQ7KM0iakpIb0HgLWww2n9RaufHnu4LY/rEJ
 VyiUm6ctIHkTsPyN+srGDVhdwTZ4KfC2VciTxfEBFmsHUIZOKx7yUUqClfgZ/s4knV5a
 IuVlZihoMNCFo0qnYmXSshy/A/CAMSMLktFy9fX/KT8fqp4mAaE/ca2aCRM867GRK2ZL
 2LYOjsyFYeghxYzKgGYVuHhoMEQeqUpWbe2Zv1Au7/YCD3cNIeTdimbYjrotzK2QDa2g
 0CE2Fnqxdbfanzr603oVU0NhucR7UqOqk0aobHjuhI+aFOo6eEH/BWTkjkHmvZ7p/q7j
 bYDg==
X-Gm-Message-State: AO0yUKUrnwlJP+HG0Sdp8lDvWPE9nVCFvAplGeIdCclZxBkVu90yBdnq
 UmZwohsDG+OSBOk6NXl91wY3ZGIIgabLO+lRNLNoS1SCyrG4
X-Google-Smtp-Source: AK7set9ZXVyppZbO8Sgw+FCYj/LazGWYRyFYmdeWkOBKOKzYPN5q9nFzNPMPBucxVHPVz1CYYkd1kT1Eq1M7TrNiK1wK75EBP8YP
MIME-Version: 1.0
X-Received: by 2002:a02:b88c:0:b0:3a9:67b6:18bd with SMTP id
 p12-20020a02b88c000000b003a967b618bdmr6763867jam.46.1675928673314; Wed, 08
 Feb 2023 23:44:33 -0800 (PST)
Date: Wed, 08 Feb 2023 23:44:33 -0800
In-Reply-To: <000000000000f2b07b05d5dc87cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003deeef05f43f8d47@google.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Tue, 14 Feb 2023 09:49:16 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

