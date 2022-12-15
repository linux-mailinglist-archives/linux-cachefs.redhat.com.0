Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A25D64DBFB
	for <lists+linux-cachefs@lfdr.de>; Thu, 15 Dec 2022 14:10:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671109824;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=I2oTyYwsMv94bCORMi9spBwr/mnigzuMZqvUHECG9Qc=;
	b=TqFwWOjoTATVQvfk7kib1e8Ho2b8DAO43yQfmP1vyEMth7AVc0DMnm0k4arl8wfvfN2MSh
	jEIQsFr6cOfb5NDDbooPy1mc7w4280JZx9ladPX2bwFvmJUm/5FDE1kGj1v7KwLCOWAsMI
	P+aXLrXnmZTs2yoiJJ0xzfQ5YVPQ2DU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-uiUP87HoNnK7zb8nNXUv1Q-1; Thu, 15 Dec 2022 08:10:21 -0500
X-MC-Unique: uiUP87HoNnK7zb8nNXUv1Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E204F101A55E;
	Thu, 15 Dec 2022 13:10:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CC0CB40C2005;
	Thu, 15 Dec 2022 13:10:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A0F371946A6C;
	Thu, 15 Dec 2022 13:10:18 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CD78019466DF for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 15 Dec 2022 07:40:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AD73F14171BE; Thu, 15 Dec 2022 07:40:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5E1114171C0
 for <linux-cachefs@redhat.com>; Thu, 15 Dec 2022 07:40:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A6D01C05AB0
 for <linux-cachefs@redhat.com>; Thu, 15 Dec 2022 07:40:29 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-404-uRH4dJnWOZuGdG-Pl54WkQ-1; Thu, 15 Dec 2022 02:40:27 -0500
X-MC-Unique: uRH4dJnWOZuGdG-Pl54WkQ-1
Received: by mail-il1-f199.google.com with SMTP id
 x10-20020a056e021bca00b00302b6c0a683so11430830ilv.23
 for <linux-cachefs@redhat.com>; Wed, 14 Dec 2022 23:40:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=beK/RyAk6JMkokDhacR9sWsAak3KfcE5cJn8YM9YfXo=;
 b=hPumzifpg1z2FKwGksmIAoOGG0viPBnCDcCYX3piggYOMOuvw/GDdf6lnV8+UQg99z
 X8p76dA2XXfXZRP5mRl85cBaThhYwW7ruj1AzuwpaAJZAmnYOwXPskPev470OoCkrEnu
 VMUKOqobAAESTPOtrSGM8AqRGBnQtaHOXyCHvKZF092lJOf8r2rNXuPyYQ3XBiy4Vsxx
 94kIq4uq5Lm0JDh6S6ni8l399QvomyATMkN77MqsBidkehhQNTnFXkPLRvyWuS4zmxfw
 aP2R4W0M8Lldg11xzYsC/CyJqskimfA4+2JZvfwOF/rwz9BWRrhXmbhSJVJ4xapqWpio
 aTCg==
X-Gm-Message-State: ANoB5plZ7whqSS94T9MU5kcQ9bTWVDn8Pp2nAwYbZCJwayF4Ry9AQqGP
 o2wbhyVeSAQJB8bYoI9nb5J+dA4rZ/ugoCGmU5+36j1z05/q
X-Google-Smtp-Source: AA0mqf5rjfC/qHzBvbu7vKT0UKU/G6DITpJJBSIEAgiV6RtdAfbCITH1DkIU9vyJGn1MMqwemKr6tiKHOU5jYJpBwRmrXrdiIwT2
MIME-Version: 1.0
X-Received: by 2002:a92:d185:0:b0:303:898e:3cf7 with SMTP id
 z5-20020a92d185000000b00303898e3cf7mr4300613ilz.136.1671090027173; Wed, 14
 Dec 2022 23:40:27 -0800 (PST)
Date: Wed, 14 Dec 2022 23:40:27 -0800
In-Reply-To: <000000000000f2b07b05d5dc87cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000075205005efd8f711@google.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Thu, 15 Dec 2022 13:10:17 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

