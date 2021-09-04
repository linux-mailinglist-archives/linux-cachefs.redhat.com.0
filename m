Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8924C404660
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Sep 2021 09:39:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-RBCfatxYNHm0V4H9tOg5VQ-1; Thu, 09 Sep 2021 03:39:07 -0400
X-MC-Unique: RBCfatxYNHm0V4H9tOg5VQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD0435074C;
	Thu,  9 Sep 2021 07:39:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD4E46788C;
	Thu,  9 Sep 2021 07:39:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C77C4EA2A;
	Thu,  9 Sep 2021 07:39:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 184DIJlu006800 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 4 Sep 2021 09:18:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8FF3D1004026; Sat,  4 Sep 2021 13:18:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B8BA1111A48
	for <linux-cachefs@redhat.com>; Sat,  4 Sep 2021 13:18:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA7C3858EEC
	for <linux-cachefs@redhat.com>; Sat,  4 Sep 2021 13:18:16 +0000 (UTC)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
	[209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-169-H7R1WjXSPWOgE6xNQcYVaw-1; Sat, 04 Sep 2021 09:18:15 -0400
X-MC-Unique: H7R1WjXSPWOgE6xNQcYVaw-1
Received: by mail-il1-f198.google.com with SMTP id
	s15-20020a056e02216f00b002276040aa1dso1266454ilv.3
	for <linux-cachefs@redhat.com>; Sat, 04 Sep 2021 06:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
	:from:to;
	bh=DTcitzNwwwfDLGiph5ugAcsPhJeXuriZRhOl1FDOjE4=;
	b=g/Cehq0iDk7Ecf9+SJpa/HNt2RjHj3h4KpDCbKnKXGiKq1qaw1ejzJg7iTlJWnAnBw
	cdU0U00uAlr4/jqfwdGAMDtGK/+vbSHU8fIO59M3fcDl9h4PjsukEOncmJQOQf6ThAcH
	2IbJGVJBlU6L91U34fiwc9HqEYiFye2I3ZA2MzAcgC6eNog62oOxGs2mwxmLV02Jym8u
	Gy+0CNdQTkgYhbfTnfeF5We9SzBTfkUXbBDhJ06kGhv87DPZTEkPcEC8Uk1CyjWn+vCu
	07BG3kl2jggSzfgwoFMqzYGg3sQq9cfcTGdbCwYIzALDSxuEUVcQxwbHXyH1TjeoHsX9
	Rknw==
X-Gm-Message-State: AOAM533sZYT6pceq36KK2jyj5E2VUE2wLK1Xmwqubn086YKU/JY9aNYl
	/j1vidSVW0GbLJQHlHVrkcW4WOjLk+Z7a6vWBFCpx6/HWIHv
X-Google-Smtp-Source: ABdhPJzzAYnXS6olwz1ENWgZc/oP4zhdHKTMsi9FQ/GneXxD1w35pB5VnWastbwjB53pyB+tq6s4U7H/8D++e7bR3Kd0e2tkGr8k
MIME-Version: 1.0
X-Received: by 2002:a92:c848:: with SMTP id b8mr2569244ilq.54.1630761494367;
	Sat, 04 Sep 2021 06:18:14 -0700 (PDT)
Date: Sat, 04 Sep 2021 06:18:14 -0700
In-Reply-To: <00000000000010f70d05cb1d2407@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000095d18505cb2b3fd5@google.com>
From: syzbot <syzbot+ba74b85fa15fd7a96437@syzkaller.appspotmail.com>
To: asml.silence@gmail.com, axboe@kernel.dk, dhowells@redhat.com,
	dvyukov@google.com, gregkh@linuxfoundation.org,
	io-uring@vger.kernel.org, jlayton@redhat.com, linux-cachefs@redhat.com, 
	linux-kernel@vger.kernel.org, rafael@kernel.org,
	syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Thu, 09 Sep 2021 03:39:00 -0400
Subject: Re: [Linux-cachefs] [syzbot] general protection fault in
	__io_arm_poll_handler
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

syzbot has bisected this issue to:

commit 884a76881fc5f5c9c04de1b640bed2c340929842
Author: David Howells <dhowells@redhat.com>
Date:   Mon Feb 10 10:00:22 2020 +0000

    fscache: Procfile to display cookies

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=114e665d300000
start commit:   a9c9a6f741cd Merge tag 'scsi-misc' of git://git.kernel.org..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=134e665d300000
console output: https://syzkaller.appspot.com/x/log.txt?x=154e665d300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c84ed2c3f57ace
dashboard link: https://syzkaller.appspot.com/bug?extid=ba74b85fa15fd7a96437
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=137a45a3300000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=105ba169300000

Reported-by: syzbot+ba74b85fa15fd7a96437@syzkaller.appspotmail.com
Fixes: 884a76881fc5 ("fscache: Procfile to display cookies")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

