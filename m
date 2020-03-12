Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 35058186634
	for <lists+linux-cachefs@lfdr.de>; Mon, 16 Mar 2020 09:20:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584346809;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=a14G/77Bmy+tLkL57gzfd9M1ip66mfx/JgyQP2D/r1E=;
	b=ONmsANxIaU1v++BzUoNfHaAzO/eLBRhzPhwpPtvcga8Dy5pgxnn4iDKP7K3wjQ6mH3p2Mi
	OHbWAutjqnWWgeRihvADHHHVL5+MU89nsL4BXMbASSGDvkrX6N6AbJc6yF4pleXzIReHay
	6ePslDOcCCmSmuncAqGHVilDtCmXC4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-t5Rv4LrRMLOw6BuOC0pY0w-1; Mon, 16 Mar 2020 04:20:07 -0400
X-MC-Unique: t5Rv4LrRMLOw6BuOC0pY0w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C03B801E6C;
	Mon, 16 Mar 2020 08:20:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F7F892F94;
	Mon, 16 Mar 2020 08:20:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A0AA886FE2;
	Mon, 16 Mar 2020 08:19:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02CFsWxh027134 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 12 Mar 2020 11:54:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D454A2063208; Thu, 12 Mar 2020 15:54:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFDD32026D67
	for <linux-cachefs@redhat.com>; Thu, 12 Mar 2020 15:54:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A51EA800A18
	for <linux-cachefs@redhat.com>; Thu, 12 Mar 2020 15:54:30 +0000 (UTC)
Received: from www.hovedpuden.dk (mail.hovedpuden.dk [93.162.70.158]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-148-b0poImdxMPKt7v2omLza9Q-1; Thu, 12 Mar 2020 11:54:26 -0400
X-MC-Unique: b0poImdxMPKt7v2omLza9Q-1
Received: from [192.168.1.78] ([130.226.24.3]) (authenticated bits=0)
	by www.hovedpuden.dk (8.15.2/8.15.2) with ESMTPSA id 02CFkN5a102827
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-cachefs@redhat.com>; Thu, 12 Mar 2020 16:46:29 +0100
To: linux-cachefs@redhat.com
From: =?UTF-8?Q?John_Damm_S=c3=b8rensen?= <john@hovedpuden.dk>
Message-ID: <83da0eec-7688-c56c-65f1-de4539cede88@hovedpuden.dk>
Date: Thu, 12 Mar 2020 16:46:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
Content-Language: da
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
	(www.hovedpuden.dk [192.168.1.100]);
	Thu, 12 Mar 2020 16:46:35 +0100 (CET)
X-Spam-Status: No, score=-102.9 required=4.3 tests=ALL_TRUSTED,BAYES_00,
	USER_IN_WHITELIST autolearn=ham autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on www.hovedpuden.dk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02CFsWxh027134
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 16 Mar 2020 04:19:49 -0400
Subject: [Linux-cachefs] Is anybody working on cachefilesd issues?
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

Hello,

I recently filed a bug for the cachefilesd used with Centos 7 but it 
seems like nobody has been assigned to the bug.

Is cachefilesd no longer an active project?

https://bugs.centos.org/view.php?id=17112


Best

John


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

