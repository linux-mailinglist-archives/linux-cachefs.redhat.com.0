Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7757857FD12
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Jul 2022 12:09:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658743791;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=I2oTyYwsMv94bCORMi9spBwr/mnigzuMZqvUHECG9Qc=;
	b=YJMzfQaQxXNJgVGEtx4fMlcCDKB1GJ6gb4uyC5vnT9sZlRAZmNOtQYiVPieJB9d9TOJ8JZ
	VE+FkwGcPPXJPx+8lCowbEqLuppkeKwAlnHBtVpoojX0ex2/OKfMMt/5O0bCIsEYqY+zn2
	Yf0EWmFkr/Yw4Kus4bqSMKVk41Cea0I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-HkusWNc6NH-t9zBuwqf94A-1; Mon, 25 Jul 2022 06:09:48 -0400
X-MC-Unique: HkusWNc6NH-t9zBuwqf94A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C70D29DD983;
	Mon, 25 Jul 2022 10:09:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5389940357BA;
	Mon, 25 Jul 2022 10:09:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5B6931945DB0;
	Mon, 25 Jul 2022 10:09:46 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5A9091947060 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 13 Jul 2022 09:19:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 36BFA492CA4; Wed, 13 Jul 2022 09:19:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32CA9492C3B
 for <linux-cachefs@redhat.com>; Wed, 13 Jul 2022 09:19:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A33A29AA2EB
 for <linux-cachefs@redhat.com>; Wed, 13 Jul 2022 09:19:20 +0000 (UTC)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-3uGPN74TNV-ZfHetTL47jQ-1; Wed, 13 Jul 2022 05:19:18 -0400
X-MC-Unique: 3uGPN74TNV-ZfHetTL47jQ-1
Received: by mail-il1-f198.google.com with SMTP id
 i8-20020a056e021d0800b002dc704e34a5so5632255ila.13
 for <linux-cachefs@redhat.com>; Wed, 13 Jul 2022 02:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=beK/RyAk6JMkokDhacR9sWsAak3KfcE5cJn8YM9YfXo=;
 b=p4cdPi72pyckFGav6MdGS9mcHEP2mibtTMU1ou+iDAOpV+UwyEJK531OZkI50TMAF4
 QQCONZLAN4PRf1wz1GXIdxt4k2Dlz7XOG99Rs6YBHwnNX5LSXCCDAVtHz+X6w4HEECQb
 2dKb/pCirS9U3V4y1zY25j0kBNm9fP02YWAu4yio8qyBEmMOqeNUQAqRMn6m0axq/U9c
 NbmkMa1DYINVa7ywR/mbuid5mXk+W9ttW7rYMRT3c3kemjAxmIJOGIvtz+gXFk/HNwc/
 zdzX0CBfINbd43amE0Qx2MBrTymWyWflMuRw11MqMdg+xb49vlpq/uPsOzop5AbGVWMC
 /LYA==
X-Gm-Message-State: AJIora+YhMINzqXYyYxR6WsamBwoQ6yOeKkufPBMvR+k1q2E37pxdT0H
 aPH4ppSxsqrZ6aG0vU0jqWQxzGPd+t7luiKJZeqaL31hIjEj
X-Google-Smtp-Source: AGRyM1tGKk8L7CaPoHPZN3L32agR0DF5b8G/3cjRJ3OTHH6uwupEEMGc5Zzm463FDp7p6zPKyV8fHNejR4x+ih82L8fDnCC6iM8z
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1412:b0:33f:7cd8:6a79 with SMTP id
 k18-20020a056638141200b0033f7cd86a79mr1282583jad.119.1657703957555; Wed, 13
 Jul 2022 02:19:17 -0700 (PDT)
Date: Wed, 13 Jul 2022 02:19:17 -0700
In-Reply-To: <000000000000f2b07b05d5dc87cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008870ab05e3ac4783@google.com>
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
X-Mailman-Approved-At: Mon, 25 Jul 2022 10:09:45 +0000
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

