Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF24519A0A
	for <lists+linux-cachefs@lfdr.de>; Wed,  4 May 2022 10:39:11 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-R_FK4IyfNumCpdXDPNnN2w-1; Wed, 04 May 2022 04:39:07 -0400
X-MC-Unique: R_FK4IyfNumCpdXDPNnN2w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB0963C02B4A;
	Wed,  4 May 2022 08:39:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 16765432738;
	Wed,  4 May 2022 08:39:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2B8251947048;
	Wed,  4 May 2022 08:39:03 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E2BC31947040 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  4 May 2022 08:39:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D0CFD432721; Wed,  4 May 2022 08:39:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB1D1432716
 for <linux-cachefs@redhat.com>; Wed,  4 May 2022 08:39:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D1F93C02B4D
 for <linux-cachefs@redhat.com>; Wed,  4 May 2022 08:39:01 +0000 (UTC)
Received: from nibbler.cm4all.net (nibbler.cm4all.net [82.165.145.151]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-2jDnpDrANUy1Wtvc49y2JQ-1; Wed, 04 May 2022 04:38:55 -0400
X-MC-Unique: 2jDnpDrANUy1Wtvc49y2JQ-1
Received: from localhost (localhost [127.0.0.1])
 by nibbler.cm4all.net (Postfix) with ESMTP id A231CC0101
 for <linux-cachefs@redhat.com>; Wed,  4 May 2022 10:38:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at nibbler.cm4all.net
Received: from nibbler.cm4all.net ([127.0.0.1])
 by localhost (nibbler.cm4all.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id LJ59OYj25_zB for <linux-cachefs@redhat.com>;
 Wed,  4 May 2022 10:38:46 +0200 (CEST)
Received: from zero.intern.cm-ag (zero.intern.cm-ag [172.30.16.10])
 by nibbler.cm4all.net (Postfix) with SMTP id 8025CC00A5
 for <linux-cachefs@redhat.com>; Wed,  4 May 2022 10:38:46 +0200 (CEST)
Received: (qmail 29461 invoked from network); 4 May 2022 14:31:48 +0200
Received: from unknown (HELO rabbit.intern.cm-ag) (172.30.3.1)
 by zero.intern.cm-ag with SMTP; 4 May 2022 14:31:48 +0200
Received: by rabbit.intern.cm-ag (Postfix, from userid 1023)
 id 52E234609CE; Wed,  4 May 2022 10:38:46 +0200 (CEST)
Date: Wed, 4 May 2022 10:38:46 +0200
From: Max Kellermann <mk@cm4all.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <YnI7lgazkdi6jcve@rabbit.intern.cm-ag>
References: <Yl75D02pXj71kQBx@rabbit.intern.cm-ag>
 <Yl7d++G25sNXIR+p@rabbit.intern.cm-ag>
 <YlWWbpW5Foynjllo@rabbit.intern.cm-ag>
 <507518.1650383808@warthog.procyon.org.uk>
 <509961.1650386569@warthog.procyon.org.uk>
 <705278.1650462934@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <705278.1650462934@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022/04/20 15:55, David Howells <dhowells@redhat.com> wrote:
> I have a tentative patch for this - see attached.

Quick feedback: your patch has been running on our servers for two
weeks, and I have received no new complaints about corrupted files.
That doesn't prove the patch is correct or that it really solves my
problem, but anyway it's a good sign.  Thanks so far.

Max

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

