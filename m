Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 915D82BAF1E
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 16:39:15 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-2zEuhw7WOq2_wWN7FR4TQQ-1; Fri, 20 Nov 2020 10:39:10 -0500
X-MC-Unique: 2zEuhw7WOq2_wWN7FR4TQQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7825218C43FA;
	Fri, 20 Nov 2020 15:39:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65B5F6085A;
	Fri, 20 Nov 2020 15:39:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99A081809C9F;
	Fri, 20 Nov 2020 15:39:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AEDwIWP028228 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 14 Nov 2020 08:58:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9DEEAF4ECA; Sat, 14 Nov 2020 13:58:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98AD9F4EBD
	for <linux-cachefs@redhat.com>; Sat, 14 Nov 2020 13:58:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A458858290
	for <linux-cachefs@redhat.com>; Sat, 14 Nov 2020 13:58:16 +0000 (UTC)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
	[209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-6-PsuIihZFN-2A4AjcDwCEuQ-1; Sat, 14 Nov 2020 08:58:10 -0500
X-MC-Unique: PsuIihZFN-2A4AjcDwCEuQ-1
Received: by mail-il1-f198.google.com with SMTP id f66so8608392ilh.17
	for <linux-cachefs@redhat.com>; Sat, 14 Nov 2020 05:58:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
	:from:to;
	bh=s0HhNxyEyT0xGFdyySpUNPcIA2PSbHMVzYjn4i6pMDI=;
	b=UZVaZibZTSPC9CScAnfTtIrX2ofYvKEi1op4kcsSXG8+7muU+32CaceEjPnD71/5HN
	l1eVep6t4hVyo8GmiIAqHCWTID2RDuBXnCQfJqVB/8vfiW3tlSjEvKwT5/x6n+OPBoce
	GrfzyAFGQWnnqaGb8TP+kXYROxg4jczRam0H1o9M7KrrhPgB1g/wVxgkzJm5S5sqNxmh
	srpZNp3xw0EGr8v4eRP0/RzftU4u9kaEOyhYs2ifqIQxNKO3urUkBdL3j74Vr6qYrcdw
	jEWW2f5frH0ujhN2G4aLPIE3ZPb/cUDNCXy3MZxi/m5h1WOFjrErRO6EKEObwQNV5Ciz
	Z5dg==
X-Gm-Message-State: AOAM532g39wzDeZYZsArRohRjto+n39xWIgvD66S1bjSYOex/sPBAlwO
	Tt5RCe/cmURCz/qVW73KfqnokgUjtXO8WUSy4UjT9I8j5iwb
X-Google-Smtp-Source: ABdhPJyxenFYpCjo1t6qQHP+un9WkzqJ8nRkH6t/5mzElJzi/nBa2BP0nv2C/VxqNPkG7/81c1rM4Zhdl5je9KkdYF+cftwTDBjn
MIME-Version: 1.0
X-Received: by 2002:a6b:ef11:: with SMTP id k17mr3094675ioh.210.1605362289857; 
	Sat, 14 Nov 2020 05:58:09 -0800 (PST)
Date: Sat, 14 Nov 2020 05:58:09 -0800
In-Reply-To: <0000000000004740cd05ac444126@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000005d94d05b4118980@google.com>
From: syzbot <syzbot+f59c67285cb61166a0cf@syzkaller.appspotmail.com>
To: dhowells@redhat.com, foxhlchen@gmail.com, hdanton@sina.com,
	linux-afs@lists.infradead.org, linux-cachefs-bounces@redhat.com,
	linux-cachefs@redhat.com, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 20 Nov 2020 10:39:06 -0500
Subject: Re: [Linux-cachefs] KASAN: use-after-free Write in afs_manage_cell
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

syzbot suspects this issue was fixed by commit:

commit 1d0e850a49a5b56f8f3cb51e74a11e2fedb96be6
Author: David Howells <dhowells@redhat.com>
Date:   Fri Oct 16 12:21:14 2020 +0000

    afs: Fix cell removal

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15b78dba500000
start commit:   da690031 Merge branch 'i2c/for-current' of git://git.kerne..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=de7f697da23057c7
dashboard link: https://syzkaller.appspot.com/bug?extid=f59c67285cb61166a0cf
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10960a8b900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17e938cf900000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: afs: Fix cell removal

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

