Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B9359F85C
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Aug 2022 13:08:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661339292;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=I2oTyYwsMv94bCORMi9spBwr/mnigzuMZqvUHECG9Qc=;
	b=OTJ8/YE2g7bdgYAFD2/MRWyRZumK2bOSunsXVht/MEHqGA+XPFjZnUMGr+p8CNUqxGOeyr
	QMDaJ/1o00N1p5Asa+rqFpxIwlnq1oYR7NHRHrCZPEPw5nwP9DBAdwRZf5JTpbtsCXiexx
	3Ekn7nNNp6Va3QyLnYPtEBllHCk5lRw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-on6AQDhAPoS_przWOpCDRA-1; Wed, 24 Aug 2022 07:08:09 -0400
X-MC-Unique: on6AQDhAPoS_przWOpCDRA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A1B73C0ED61;
	Wed, 24 Aug 2022 11:08:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D394AC15BB3;
	Wed, 24 Aug 2022 11:08:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BF9C11946A52;
	Wed, 24 Aug 2022 11:08:08 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 81D021946A42 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 24 Aug 2022 09:22:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9A2C51415137; Wed, 24 Aug 2022 09:22:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95AB41415125
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 09:22:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D63A85A58A
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 09:22:23 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-675-u7C3Cp8TNASlQWVq9gqUdA-1; Wed, 24 Aug 2022 05:22:21 -0400
X-MC-Unique: u7C3Cp8TNASlQWVq9gqUdA-1
Received: by mail-io1-f72.google.com with SMTP id
 z30-20020a05660217de00b00688bd42dc1dso8982302iox.15
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 02:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc;
 bh=beK/RyAk6JMkokDhacR9sWsAak3KfcE5cJn8YM9YfXo=;
 b=scmEe6IC8H0WwLGJAsNkrwaTgiQTOXKRQDUdREgfKnEZ9qlX5QZM537n+FBAnRFGCP
 U4saDENi6zgSk6S+Y4HJY9m8QUabyORqeMtkeAZivBW4LvQIW6mdLFL6WJ04dO0EsXtZ
 tRb2U94V2XiMEcciRoGEjrHWV1+RmbJmUXi7z7Ki6h7Pd38HS3PTNImpeneESO4BWROr
 uD5aTeOx1F45xrAKsDDTJ7fhapa0hqha+wcuylomx2rfJxZDxZ+vxRJHKORkCCgq9mE/
 d5MWMs9yRY8pbrdn0VJU4cG09H72w9+AJzvQT69mB0a+ittg+xN1YcVIan7eLN4GolJb
 AIjA==
X-Gm-Message-State: ACgBeo3Zx7KIs3EXPgvasWy7yGEHr0vyRDC3BoF3lf2GBGpLOZ4SIQUJ
 uAhGTXCq6OmoTUEcdrcY8iNgpqej/M06YYwwTGiU+jDZtAt8
X-Google-Smtp-Source: AA6agR6mP2aXHamSsBpvwnCpSKmNwCSi2tgtr0N3coyIek8Yc/zb44/ELnSpufpvajxhye3fmSAykNr+kNPBcTUHWfmsvDw8LjEd
MIME-Version: 1.0
X-Received: by 2002:a05:6638:140c:b0:349:b5bb:5129 with SMTP id
 k12-20020a056638140c00b00349b5bb5129mr10501248jad.276.1661332941207; Wed, 24
 Aug 2022 02:22:21 -0700 (PDT)
Date: Wed, 24 Aug 2022 02:22:21 -0700
In-Reply-To: <000000000000f2b07b05d5dc87cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d082f105e6f93705@google.com>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mailman-Approved-At: Wed, 24 Aug 2022 11:08:07 +0000
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

