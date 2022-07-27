Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D485583BD4
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Jul 2022 12:11:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659003118;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=I2oTyYwsMv94bCORMi9spBwr/mnigzuMZqvUHECG9Qc=;
	b=hWLMdwBiEWBoP3bBuQfzZNnjA12InbMaIvutMFvClmZRT7xv5QzBF54iTG1ATuLcUIXiFQ
	7HqXIW9TJ5tuGRJghp3X7blc/AYUHh3f9ck5FY8HtUiIKME0wC9rTJgdd4tkY5yeMzLN2P
	81l4sslcdY7KtQd4k+xS7tLLYOkPbr8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-ZLnP9DnPN2KifTRFiNZtIg-1; Thu, 28 Jul 2022 06:11:55 -0400
X-MC-Unique: ZLnP9DnPN2KifTRFiNZtIg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 523AB8115B1;
	Thu, 28 Jul 2022 10:11:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5A4FA401E92;
	Thu, 28 Jul 2022 10:11:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0FE391945DAD;
	Thu, 28 Jul 2022 10:11:53 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0CCD11945D94 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 27 Jul 2022 09:20:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E51EC492CA5; Wed, 27 Jul 2022 09:20:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E17B1492CA2
 for <linux-cachefs@redhat.com>; Wed, 27 Jul 2022 09:20:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C908E85A585
 for <linux-cachefs@redhat.com>; Wed, 27 Jul 2022 09:20:27 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-e9t0nXPjN1iv5v5Oo33FAA-1; Wed, 27 Jul 2022 05:20:25 -0400
X-MC-Unique: e9t0nXPjN1iv5v5Oo33FAA-1
Received: by mail-il1-f197.google.com with SMTP id
 d12-20020a056e02214c00b002dd143bee38so10632646ilv.7
 for <linux-cachefs@redhat.com>; Wed, 27 Jul 2022 02:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=beK/RyAk6JMkokDhacR9sWsAak3KfcE5cJn8YM9YfXo=;
 b=SK7QPIAx7Ex8ROh5Kx406X6LxRsDayBexi6ZxNg6NZiTdGvVs3Tz0E6yqYlRGTHjUW
 YJTVBkhjeb+tPnR0ZXQlvpNA/wwIwhGlTmRGtsFbKSs5CwkqYYDZa9A+ld/LIElhRFyL
 K32l3oU5vRG8r1b3MGvOdbqYW2ZDOXKBcPUqLDgijNXruB5dxp6sM9dAe8Xl9Pjlf1Rw
 KPwf/eqNrWA6TrQP+qoGoBpctpXulsrsi7aMUES8Pic2OYNlDHMnvoOjiuR8jhhq92ZL
 /aIf32kkdE2BF8jFl8RywaWfiQ9E2pqkNAWpYD874uRmtXAWEcX04i3gmyNC5o7W8ugU
 wTjQ==
X-Gm-Message-State: AJIora8rxQLeAIEjWycqU2sh1txoswAe0S11X/vzd2WNZPFVtX/cvz/S
 cKBXJ9QbavKH7Xdh/YqmJQ66DJgw+Mykj0f0ICuQA+2uF3PN
X-Google-Smtp-Source: AGRyM1v/ltVWJlJHyRfkORqGR+witY3Er6p0naC06l+kk7wNaHtLkhDvjcFWPeBQ0VmmCL3i65iAjbIQO7R8MobdoaCJl4FBANDm
MIME-Version: 1.0
X-Received: by 2002:a92:cd8f:0:b0:2dd:407e:74d7 with SMTP id
 r15-20020a92cd8f000000b002dd407e74d7mr6563029ilb.226.1658913625333; Wed, 27
 Jul 2022 02:20:25 -0700 (PDT)
Date: Wed, 27 Jul 2022 02:20:25 -0700
In-Reply-To: <000000000000f2b07b05d5dc87cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000059e83805e4c5ed5d@google.com>
From: syzbot <syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-cachefs-bounces@redhat.com, 
 linux-cachefs-owner@redhat.com, linux-cachefs@redhat.com, 
 linux-kernel@vger.kernel.org, mudongliangabcd@gmail.com, 
 syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mailman-Approved-At: Thu, 28 Jul 2022 10:11:52 +0000
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

