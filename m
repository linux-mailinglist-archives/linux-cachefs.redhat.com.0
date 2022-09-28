Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C195EF076
	for <lists+linux-cachefs@lfdr.de>; Thu, 29 Sep 2022 10:29:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664440180;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=I2oTyYwsMv94bCORMi9spBwr/mnigzuMZqvUHECG9Qc=;
	b=dc+j7nUhE5rw5x1Gh/4veZiL0jgEp5byp9EOVAzgcI3QtqrDbt4UwE3O9Tlw0llQFxTmaC
	kZHvMuz8TlJA1/YMLe+DYLbVrB6zqpFZO7owQUig8IyYo2mg1IRX0A0mJkvirI5FTPOFKN
	eUfJEwLxl5nLki6qNCBd93tD4YylViw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-86Gv1Px1MzaPCBjKvsGWqw-1; Thu, 29 Sep 2022 04:29:37 -0400
X-MC-Unique: 86Gv1Px1MzaPCBjKvsGWqw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0E358027ED;
	Thu, 29 Sep 2022 08:29:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E24A49BB61;
	Thu, 29 Sep 2022 08:29:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 307FA1946A50;
	Thu, 29 Sep 2022 08:29:36 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 78C4919465B1 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 28 Sep 2022 09:15:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1E7F41457F00; Wed, 28 Sep 2022 09:15:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 155221457F01
 for <linux-cachefs@redhat.com>; Wed, 28 Sep 2022 09:15:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A33E08027FD
 for <linux-cachefs@redhat.com>; Wed, 28 Sep 2022 09:15:29 +0000 (UTC)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-457-343pxaMIM3m8QiYNbWzUqg-1; Wed, 28 Sep 2022 05:15:27 -0400
X-MC-Unique: 343pxaMIM3m8QiYNbWzUqg-1
Received: by mail-il1-f200.google.com with SMTP id
 x6-20020a056e021bc600b002f8c7ccd2c4so3011445ilv.17
 for <linux-cachefs@redhat.com>; Wed, 28 Sep 2022 02:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date;
 bh=beK/RyAk6JMkokDhacR9sWsAak3KfcE5cJn8YM9YfXo=;
 b=r/qtgJ7OdsUptMXicsLPHecVBq5M98Yv6gEqzfYHOkZfRZEtlgxBCgFeiykD0lj8uO
 KbBVv4pRo33a3lfWaoF2Ww5QnpMkB84apGCX9m5IvSTt/gRsJHkKXOxttTBZrqAGARoK
 zMVkFU68yFZcB2eQ9hazCKarHGjo5WOE8eb404E3lI0vz4rJCh3L5taOnH3l6WvkAydr
 QUCcHWopUCc6W4/JapDCHnG6KIk/nrlchASS72pmA47CqmuqkUr9j1PFtd/f1MVlC28Z
 k9yTnYMYN6/ohJ2SBIqtylXuTefuLFoX0GvlNsHZaeF906PZnrd3YH0Ll0SpVavjlNPY
 H97A==
X-Gm-Message-State: ACrzQf0fFZ8CMewWx01WhBMuAX9wJa0r375izDLZlko/pvLtNj2OcCVj
 lkexFslQ/xkRhQ9xuJ7dRxFEImS3Ehburn7HJ8w7yNdOspxY
X-Google-Smtp-Source: AMsMyM6BIiupKnvoAFOsnwm0XJAWBDCHCGcAp1YvPH/VWKpWZj/AjdMc8eNeAEV12usUyE8/g0EF6bCHNMAtpYRqmrNcQRRPx2su
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1074:b0:2f6:15d9:4719 with SMTP id
 q20-20020a056e02107400b002f615d94719mr14583204ilj.123.1664356527089; Wed, 28
 Sep 2022 02:15:27 -0700 (PDT)
Date: Wed, 28 Sep 2022 02:15:27 -0700
In-Reply-To: <000000000000f2b07b05d5dc87cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000093aefb05e9b93343@google.com>
From: syzbot <syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-cachefs-bounces@redhat.com, 
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Thu, 29 Sep 2022 08:29:35 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

