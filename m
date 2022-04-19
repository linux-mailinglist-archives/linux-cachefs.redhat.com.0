Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FB55076F8
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Apr 2022 20:02:10 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-0omc63GjNsGrR__kbvLBHA-1; Tue, 19 Apr 2022 14:02:08 -0400
X-MC-Unique: 0omc63GjNsGrR__kbvLBHA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C9723802AD0;
	Tue, 19 Apr 2022 18:02:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 66750145BEE7;
	Tue, 19 Apr 2022 18:02:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2BC9A1940342;
	Tue, 19 Apr 2022 18:02:05 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A2F311947BBF for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 19 Apr 2022 18:02:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9069A40D296B; Tue, 19 Apr 2022 18:02:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C22340D2969
 for <linux-cachefs@redhat.com>; Tue, 19 Apr 2022 18:02:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 746051014A94
 for <linux-cachefs@redhat.com>; Tue, 19 Apr 2022 18:02:03 +0000 (UTC)
Received: from nibbler.cm4all.net (nibbler.cm4all.net [82.165.145.151]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-biklQ4Y6P5-1XqdsHxk7AA-1; Tue, 19 Apr 2022 14:02:01 -0400
X-MC-Unique: biklQ4Y6P5-1XqdsHxk7AA-1
Received: from localhost (localhost [127.0.0.1])
 by nibbler.cm4all.net (Postfix) with ESMTP id 7CBC3C00DA
 for <linux-cachefs@redhat.com>; Tue, 19 Apr 2022 20:01:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at nibbler.cm4all.net
Received: from nibbler.cm4all.net ([127.0.0.1])
 by localhost (nibbler.cm4all.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id PCJsJd9K6B4m for <linux-cachefs@redhat.com>;
 Tue, 19 Apr 2022 20:01:52 +0200 (CEST)
Received: from zero.intern.cm-ag (zero.intern.cm-ag [172.30.16.10])
 by nibbler.cm4all.net (Postfix) with SMTP id 1F2CFC00B9
 for <linux-cachefs@redhat.com>; Tue, 19 Apr 2022 20:01:52 +0200 (CEST)
Received: (qmail 2504 invoked from network); 19 Apr 2022 23:51:54 +0200
Received: from unknown (HELO rabbit.intern.cm-ag) (172.30.3.1)
 by zero.intern.cm-ag with SMTP; 19 Apr 2022 23:51:54 +0200
Received: by rabbit.intern.cm-ag (Postfix, from userid 1023)
 id E6D21460F1C; Tue, 19 Apr 2022 20:01:51 +0200 (CEST)
Date: Tue, 19 Apr 2022 20:01:51 +0200
From: Max Kellermann <mk@cm4all.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <Yl75D02pXj71kQBx@rabbit.intern.cm-ag>
References: <Yl7d++G25sNXIR+p@rabbit.intern.cm-ag>
 <YlWWbpW5Foynjllo@rabbit.intern.cm-ag>
 <507518.1650383808@warthog.procyon.org.uk>
 <509961.1650386569@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <509961.1650386569@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Linux-cachefs] fscache corruption in Linux 5.17?
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
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 Max Kellermann <mk@cm4all.com>, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022/04/19 18:42, David Howells <dhowells@redhat.com> wrote:
> Could the file have been modified by a third party?

According to our support tickets, the customers used WordPress's
built-in updater, which resulted in corrupt PHP sources.

We have configured stickiness in the load balancer; HTTP requests to
one website always go through the same web server.  Which implies that
the same web server that saw the corrupt files was the very same one
that wrote the new file contents.  This part surprises me, because
writing a page to the NFS server should update (or flush/invalidate)
the old cache page.  It would be easy for a *different* NFS client to
miss out on updated file contents, but this is not what happened.

On 2022/04/19 18:47, David Howells <dhowells@redhat.com> wrote:
> Do the NFS servers change the files that are being served - or is it
> just WordPress pushing the changes to the NFS servers for the web
> servers to then export?

I'm not sure if I understand this question correctly.  The NFS server
(a NetApp, btw.) sees the new file contents correctly; all other web
servers also see non-corrupt new files.  Only the one web server which
performed the update saw broken files.

Max

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

