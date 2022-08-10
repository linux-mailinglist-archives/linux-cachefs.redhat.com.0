Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF885983C1
	for <lists+linux-cachefs@lfdr.de>; Thu, 18 Aug 2022 15:10:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660828206;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=I2oTyYwsMv94bCORMi9spBwr/mnigzuMZqvUHECG9Qc=;
	b=Asu5dk+oJjhqe8YITbN0NqZZb6DLciuZeH7BDSbAHgALZ59FJmGmGPaAiju8jf+ACMiWaX
	osq7PkpO/xoePzHwyW7e/bw7Uf5jCjvreJrvX8kvrCK1Ew0vHONq1/fSMlTruHacLNvjmz
	NXNFa6uXsvl2RUBHgCuWdqrB3JAiMYQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-kHllnScOOIOvYQ40Der8eQ-1; Thu, 18 Aug 2022 09:10:03 -0400
X-MC-Unique: kHllnScOOIOvYQ40Der8eQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F9F28039A8;
	Thu, 18 Aug 2022 13:10:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4DFF6492C3B;
	Thu, 18 Aug 2022 13:10:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1E145194E11C;
	Thu, 18 Aug 2022 13:10:02 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 921A61946A57 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 10 Aug 2022 09:21:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6304F492CA5; Wed, 10 Aug 2022 09:21:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F312492CA4
 for <linux-cachefs@redhat.com>; Wed, 10 Aug 2022 09:21:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 467FC299E76A
 for <linux-cachefs@redhat.com>; Wed, 10 Aug 2022 09:21:18 +0000 (UTC)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-jFPUqiGIOC-u9WV9gzyVPg-1; Wed, 10 Aug 2022 05:21:16 -0400
X-MC-Unique: jFPUqiGIOC-u9WV9gzyVPg-1
Received: by mail-io1-f70.google.com with SMTP id
 i20-20020a5d88d4000000b0067d13ffbe8cso7826759iol.22
 for <linux-cachefs@redhat.com>; Wed, 10 Aug 2022 02:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc;
 bh=beK/RyAk6JMkokDhacR9sWsAak3KfcE5cJn8YM9YfXo=;
 b=qciVC94vgopEQjdVftluX28W8B8NHyRAQy6/8B5H+AIcqDF7t31+pYR5bFuE09Bt+U
 toqEOhM3X3xAS/oVYQdm7MKAfK71qFpnTgAGgaFYafX9LGLWVxn/e9RKvni7N9cBYE6l
 HwMp+DMzBx+DSB5a9gC1sc+3tbNGGNsagjmOTgGjK5ynsaO+AwgetL2OxqlwgGfnHdhl
 CAUXHiYqxrpztK4IpMEBbKlsD5XtG3OgG0cfmxx7kuZj5YqdnztgZlPJRtVqxspaOsy/
 T1rsSuTTAC+PJlypo5cYbqRDSHPRTYjvFqZnUbqY5y3KWQvPKuiLNfpHyDi6Ea2g19kf
 sJOw==
X-Gm-Message-State: ACgBeo1OJgihRjEfnUUL3e9MmaKZvOwIzCDltQhgQ4HMxQSSHPzdtXa0
 TiFykYTFIcaLokOJhMGapEEVr80gS0S/gGQr96vXQMFVwHz9
X-Google-Smtp-Source: AA6agR6ue90cOnN3b6APDtHTxxyZV2Ri32eZNHueoSS0CsGnxVIUIlx6F7PHmVBLe5nS869MW/sVtQ8z8zKRyRqMpful94vI3koA
MIME-Version: 1.0
X-Received: by 2002:a05:6638:3721:b0:343:47cc:848d with SMTP id
 k33-20020a056638372100b0034347cc848dmr150268jav.84.1660123275927; Wed, 10 Aug
 2022 02:21:15 -0700 (PDT)
Date: Wed, 10 Aug 2022 02:21:15 -0700
In-Reply-To: <000000000000f2b07b05d5dc87cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000025251905e5df9239@google.com>
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
X-Mailman-Approved-At: Thu, 18 Aug 2022 13:10:00 +0000
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

