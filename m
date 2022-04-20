Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 221A0508619
	for <lists+linux-cachefs@lfdr.de>; Wed, 20 Apr 2022 12:39:11 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-gv7UlIVoPUexnsnfTMiP9w-1; Wed, 20 Apr 2022 06:39:08 -0400
X-MC-Unique: gv7UlIVoPUexnsnfTMiP9w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31FC885A5A8;
	Wed, 20 Apr 2022 10:39:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AFA3F403D188;
	Wed, 20 Apr 2022 10:39:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0F4271940344;
	Wed, 20 Apr 2022 10:39:05 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 917A819451F2 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 20 Apr 2022 09:14:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6FEDA40D2969; Wed, 20 Apr 2022 09:14:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B91F404E4D6
 for <linux-cachefs@redhat.com>; Wed, 20 Apr 2022 09:14:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 507763803925
 for <linux-cachefs@redhat.com>; Wed, 20 Apr 2022 09:14:21 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-CrEJ6z5iOk2zg7wKV-oH8g-1; Wed, 20 Apr 2022 05:14:19 -0400
X-MC-Unique: CrEJ6z5iOk2zg7wKV-oH8g-1
Received: by mail-io1-f72.google.com with SMTP id
 x13-20020a0566022c4d00b0065491fa5614so796052iov.9
 for <linux-cachefs@redhat.com>; Wed, 20 Apr 2022 02:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=beK/RyAk6JMkokDhacR9sWsAak3KfcE5cJn8YM9YfXo=;
 b=Kp09IV3vX0qxtkD3f3a2idCJFyaE520D1vuq/w1WZu2r5MTEVqEE6kDhbdmoy747DI
 SdAo9seqy5C92R9ST7EXuS2gHAhTONfcSK/8RuSKDl8/R3RU2nznRlKkCYixfXnZzyPv
 UCYgc4YfFtOSQEz1D49OX6z6FczF8bHNZXUxrE1BH0DCoYBkYsqHt94ucKqW3C29+H+n
 +fvrzAe1OweJYqn/QEDXf/t9LomPY8UtWl6LPsXKkmKbZVN50gE8b6t2gFZjQo3WVR6j
 qZXopMtnj0UquVzFmfY1Th6gfRkpFgz/qiW6Z/29Bl8UG9dx5f+6hY5Vp/LyyZddNMFy
 ZCUQ==
X-Gm-Message-State: AOAM532hh2gTFN4IJwjiFW1jn8+wwGdm1dLudznGARig9ljp4lrfe4nm
 cpwjz8nZngVTIOA9UTHVZ5kXkIw8MNL5a8DU+movrj30f1No
X-Google-Smtp-Source: ABdhPJxlMZ0hRpDFaI0jdEI5Dnpg1mQUJshrHXx7KMk2sDcBb3gUQC1o+mc4qbU6FItlTkLngt806p8qF7TlTQp4DWyA7rAQ1odu
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3281:b0:648:d45d:22e with SMTP id
 d1-20020a056602328100b00648d45d022emr8220771ioz.7.1650446058846; Wed, 20 Apr
 2022 02:14:18 -0700 (PDT)
Date: Wed, 20 Apr 2022 02:14:18 -0700
In-Reply-To: <000000000000f2b07b05d5dc87cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000f008905dd126b03@google.com>
From: syzbot <syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-cachefs-bounces@redhat.com, 
 linux-cachefs@redhat.com, linux-kernel@vger.kernel.org, 
 mudongliangabcd@gmail.com, syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mailman-Approved-At: Wed, 20 Apr 2022 10:39:04 +0000
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This bug is marked as fixed by commit:
fscache: fix GPF in fscache_free_cookie
But I can't find it in any tested tree for more than 90 days.
Is it a correct commit? Please update it by replying:
#syz fix: exact-commit-title
Until then the bug is still considered open and
new crashes with the same signature are ignored.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

