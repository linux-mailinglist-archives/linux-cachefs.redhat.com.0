Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 961054E9093
	for <lists+linux-cachefs@lfdr.de>; Mon, 28 Mar 2022 10:55:03 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-Zbewkih_OES_SyurrfW4LQ-1; Mon, 28 Mar 2022 04:54:59 -0400
X-MC-Unique: Zbewkih_OES_SyurrfW4LQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF7E838008A1;
	Mon, 28 Mar 2022 08:54:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7480FC27E80;
	Mon, 28 Mar 2022 08:54:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EADAF1940342;
	Mon, 28 Mar 2022 08:54:52 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2A91C19452D2 for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 26 Mar 2022 11:53:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0323C401E9D; Sat, 26 Mar 2022 11:53:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2888401E96
 for <linux-cachefs@redhat.com>; Sat, 26 Mar 2022 11:53:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D279E299E758
 for <linux-cachefs@redhat.com>; Sat, 26 Mar 2022 11:53:17 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01olkn2061.outbound.protection.outlook.com [40.92.52.61]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-iKXFlV9oN7y9TlFeFjWEuw-1; Sat, 26 Mar 2022 07:53:13 -0400
X-MC-Unique: iKXFlV9oN7y9TlFeFjWEuw-1
Received: from TYZPR01MB3935.apcprd01.prod.exchangelabs.com
 (2603:1096:400:8::7) by SEZPR01MB4303.apcprd01.prod.exchangelabs.com
 (2603:1096:101:40::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Sat, 26 Mar
 2022 11:53:07 +0000
Received: from TYZPR01MB3935.apcprd01.prod.exchangelabs.com
 ([fe80::8dd1:e105:311a:ce51]) by TYZPR01MB3935.apcprd01.prod.exchangelabs.com
 ([fe80::8dd1:e105:311a:ce51%3]) with mapi id 15.20.5102.022; Sat, 26 Mar 2022
 11:53:06 +0000
Message-ID: <TYZPR01MB3935D1963BFD458E85412E4DF81B9@TYZPR01MB3935.apcprd01.prod.exchangelabs.com>
From: kushagra765@outlook.com
To: linux-doc@vger.kernel.org, corbet@lwn.net
Date: Sat, 26 Mar 2022 17:22:55 +0530
User-Agent: Evolution 3.36.5-0ubuntu1
X-TMN: [a/aKdxfKdbxXCxC4LG8d4rkf3FOqm/28MeRsBjj/rQA=]
X-ClientProxiedBy: BM1PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::26) To TYZPR01MB3935.apcprd01.prod.exchangelabs.com
 (2603:1096:400:8::7)
X-Microsoft-Original-Message-ID: <eeb064c760454aee4faf4c7bb08381d2065b0ceb.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc1d3b77-875d-4d90-552e-08da0f1f310f
X-MS-TrafficTypeDiagnostic: SEZPR01MB4303:EE_
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: dvJTQ08deoDJoOp4hhK81arpUgTUWwNZep2NKTyWXf1S6ssKLGecJmjn8tH/kzpFWrCj1cMftTpmMpMJigTXZ35UfYMhRmKHfVyvVfLoHiIh6yiLfpK7GQ0zTfOEWlIj/o+AWyaDqmVFfR8ZWnRcvqqIbPX/glIAE2ctP+8Wqm+PHq5m/ohLd2o/WMZm6X1Ow2yipWdTlSfIwNrXoy3OC+concHPu0j17bkEdha1opSv2Qf51664yD0z80SVtcotbq0eguYS4ppY23NCRw2gHIg2TrBEyA78Zi04GWcROID8Z7bBzX0SIZaZhw5Vst0Pz9x1X22Uz4dFp2ay/gLRxubAN6xkBNdyO6DOjNvRIZClTSbQalkiHt8P4GbYUznOrlePKixRTKSpF6Gtsc8R6F7XMoug8EFZSYqKdhkL7V8I33iI1FNcSJkrgTv3G1zMIz+CvwsiJmjjGkdutk2BOYVXvdpiPEqUFJrhupVgfam7WlLxyxJ5S9s7ypTr9xq4fL0Ns1MGuGjsxgBwi22ZNC26MeR7QMifnafuHIyLYOfPjT/7u9aoY5o1QgkUh5LavByK265HoWthOsUG1OokMQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUVHV3RVb1VCWHBpR1NUd3dWL2s4NnJiZWNGbFd4OWFlalY0ZklGdDF6V2lz?=
 =?utf-8?B?Q3phVnIzVisxQnh4dDhlYXNhNXVOdlhDckpoS21aTXRyNDM0d3I5dFA2a3ZX?=
 =?utf-8?B?UkhxcEx4cGZ3aGxSRnJGRDByVzJpUkwzMmtzaUdMWXR1N0lkd1gxQXQ1eEZl?=
 =?utf-8?B?ZGZCZEs0MkJ2TXU0bCtialZ2VmNkbmpRNS9mQXRvZS9NWGVCNkUzMjRaMFhC?=
 =?utf-8?B?OHd6VG85TVpPUEh2ckJmUjlsT3pmMng0VHJVU2ovWEJzMi9zVkd6RXR6MFBY?=
 =?utf-8?B?WDBzVXF6cVExVVFyZkJWYll1ZzdFbVFGVlJ0TzhwVU9RVkdwMm1QZG9iTnlK?=
 =?utf-8?B?d3BQL1F0ZElLdC9CcG44SHpWcGtJb1NnVGJmMnBhRU8vVEJvUUZBRjNya2lS?=
 =?utf-8?B?OGo3SnhXZGRXTWRzeXZOMVVVNDErMy9Kek9sMG84Z2dCTXlvU2ZxbWt0K1Zv?=
 =?utf-8?B?Q3cyTm9lcks2bDBCVjJ6bitWZlIyMzdXOTMrZjQ0Zm4yWXAzbU12ZmNFdlZi?=
 =?utf-8?B?eGFqcnpnUnlBWi91RXJLMjdhOVc4ZzZTbXprUVpDdThMdUQvZHN1N00veHB6?=
 =?utf-8?B?eDd1RlhIL21xSzYrN1dwVmtGeVV4T1J5YWROdVVBL1ZrTlZEckpGWjJmQVlY?=
 =?utf-8?B?WVVUL2R6bFQ0TnBUMS91OFMwYmZIZ1pkS1RvakpNREY4OVRCdk81aHJNOS8r?=
 =?utf-8?B?N2ZTdzhoblVOeVJVL1YwZlZCNmw3dCtJN1dGVzZCVW81TzBma08xTFZHNlU4?=
 =?utf-8?B?ZklkMCtmZmNwbXNRbkJTamErRnJFaWp3a1Bpd01Tc0J1MGROTGkzdjlpNTFw?=
 =?utf-8?B?Ni9TdlFtNEhoSmZhL25lUk9EMXFjczdCSnpUd2pOT3Jab0doTTRjYkRTbEdT?=
 =?utf-8?B?ZEtjKzk3QzVZUEoyME9SRDFMeG1UVTVlaWxURnpIRmlVUFVnZ2M5T1JvV2hH?=
 =?utf-8?B?bXkrL280YjNXN3FKczBldjk0Rm9XQUwraXlWWWRaTnBFc2RlNTlsdURzR001?=
 =?utf-8?B?UVZmcjVwMWlqNkxvNlVsUnZMVDZwcXVDVlhsZ3R4akVPby9FWVp6UVp1RGJz?=
 =?utf-8?B?NTYvRTk0bWYweHE4amQxUENTY3hMb29lazJtdU1sNk5pb3diNkx6RVp3MTJZ?=
 =?utf-8?B?OHFObEJMZ3MxY2pOaFlURmhGMFU4cUViTzZzRWhCTlBnWi9CcTdMM1ZEM3Bj?=
 =?utf-8?B?bXFZelBjTlUyZHNEZWtFRzRGQ0tKNkc0VEg3Q285d1V0Vk1QdUJ1TERTL1Bv?=
 =?utf-8?B?RzM2UHhqTyt6TXBJbHkzTGJPUEcxdnQ3RlJ3WFZ1S1BKaDJ0NWFIczlKWmtj?=
 =?utf-8?B?RWVxaUtQTktOTGhYMGNvUFJQNmx5dnlMVHd4dFVUWUZZV1RkcWJ4RkVZSmpJ?=
 =?utf-8?B?Q2VxWG9xVS9LT201dU0wQkkwdng2SEIzNUxUUnR2ejJ0UjdxZ0I1MWhwOEpj?=
 =?utf-8?B?Y3Y1eFJFTFh4VVdMVlZsQU9kTnlEcklXQlNzRDl0WC9lVkNtM05Kb1ZpVWNK?=
 =?utf-8?B?WkpSemxxaTY4aGFtU2RlWWMvODk3RGVmM043WXl6eC9qcWZCQVp6SFJuMnI5?=
 =?utf-8?B?VTNrbDNSYXV4a1U0bmtRZVk1MnR6VUJMVzhGcEk3dVdBMjBzWmN0cEUzZmM5?=
 =?utf-8?B?UTJzTkVmNWFEWmc3dWR4ZTlVSk1DQ096M3k1Sk5VT1VQRnN4WUdJdUJDRWFG?=
 =?utf-8?B?TmowNG5Kcnd4WGlscjdnRkhTTnNValV3VW5xNit4NFhCV2NKQTBHWE1XWUE4?=
 =?utf-8?B?dWRyTkk0c3d3MzdRcE5FL1FUYjR1ZjhQcGFTaTBkeDNzUCtkTE1hVUEzOGww?=
 =?utf-8?B?amdndnFtT2cxUml1SFM1ZCtzMG1aODZldW1sczlod3ZCQnUrck1wTjM2UldM?=
 =?utf-8?B?eEFVOE1IMFA0QUtqZ0FvMXRYeUNJeE5RWmRzZHN1NFBuOUZWNHNjZDRxS0Fl?=
 =?utf-8?Q?Y1thZ5rdMunFQgpbXRr+rwBW5iqc0Af0?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1d3b77-875d-4d90-552e-08da0f1f310f
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB3935.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2022 11:53:06.9255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR01MB4303
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mailman-Approved-At: Mon, 28 Mar 2022 08:54:51 +0000
Subject: [Linux-cachefs] [ PATCH ] Documentation: fixed doc-build warnings
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
Cc: balbi@kernel.org, tzimmermann@suse.de, arnd@arndb.de, airlied@linux.ie,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-usb@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 linux-kernel@vger.kernel.org, mripard@kernel.org, mcgrof@kernel.org,
 linux-cachefs@redhat.com, viro@zeniv.linux.org.uk, daniel@ffwll.ch,
 akpm@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From 9a9918b051d5709b5e14ca8afa29f3ef644b8688 Mon Sep 17 00:00:00 2001
From: Kushagra Verma <kushagra765@outlook.com>
Date: Sat, 26 Mar 2022 16:43:15 +0530
Subject: [PATCH] Documentation: fixed doc-build warnings

   This patch fixes the following (and 2 other) doc-build warnings:
      1. ./include/linux/dcache.h:308: warning: expecting prototype for dget, dget_dlock(). Prototype was for dget_dlock() instead

      2. ./include/linux/fscache.h:268: warning: Excess function parameter 'object' description in 'fscache_use_cookie'

      3 ./include/linux/fscache.h:285: warning: Excess function parameter 'object' description in 'fscache_unuse_cookie'

      4. ./drivers/gpu/drm/drm_format_helper.c:640: warning: Excess function parameter 'src' description in 'drm_fb_xrgb8888_to_mono_reversed'

Signed-off-by: Kushagra Verma <kushagra765@outlook.com>
---
 drivers/gpu/drm/drm_format_helper.c | 1 -
 drivers/usb/dwc3/core.c             | 1 -
 drivers/usb/dwc3/gadget.c           | 3 +--
 include/linux/dcache.h              | 2 +-
 include/linux/fscache.h             | 2 --
 5 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index bc0f49773868..d753b34950c9 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -624,7 +624,6 @@ static void drm_fb_gray8_to_mono_reversed_line(u8 *dst, const u8 *src, unsigned
  * drm_fb_xrgb8888_to_mono_reversed - Convert XRGB8888 to reversed monochrome
  * @dst: reversed monochrome destination buffer
  * @dst_pitch: Number of bytes between two consecutive scanlines within dst
- * @src: XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index f4c09951b517..63e2ccbb7c33 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -343,7 +343,6 @@ static void dwc3_frame_length_adjustment(struct dwc3 *dwc)
  *		from the default, this will set clock period in DWC3_GUCTL
  *		register.
  * @dwc: Pointer to our controller context structure
- * @ref_clk_per: reference clock period in ns
  */
 static void dwc3_ref_clk_period(struct dwc3 *dwc)
 {
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index a0c883f19a41..ee98004434df 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -660,7 +660,6 @@ static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
 /**
  * dwc3_gadget_calc_tx_fifo_size - calculates the txfifo size value
  * @dwc: pointer to the DWC3 context
- * @nfifos: number of fifos to calculate for
  *
  * Calculates the size value based on the equation below:
  *
@@ -693,7 +692,7 @@ static int dwc3_gadget_calc_tx_fifo_size(struct dwc3 *dwc, int mult)
 }
 
 /**
- * dwc3_gadget_clear_tx_fifo_size - Clears txfifo allocation
+ * dwc3_gadget_clear_tx_fifos - Clears txfifo allocation
  * @dwc: pointer to the DWC3 context
  *
  * Iterates through all the endpoint registers and clears the previous txfifo
diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index f5bba51480b2..fa35ac489a42 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -297,7 +297,7 @@ extern char *dentry_path(const struct dentry *, char *, int);
 /* Allocation counts.. */
 
 /**
- *	dget, dget_dlock -	get a reference to a dentry
+ *	dget_dlock - get a reference to a dentry
  *	@dentry: dentry to get a reference to
  *
  *	Given a dentry or %NULL pointer increment the reference count
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index d44ff747a657..9e29494241ea 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -256,7 +256,6 @@ struct fscache_cookie *fscache_acquire_cookie(struct fscache_volume *volume,
 
 /**
  * fscache_use_cookie - Request usage of cookie attached to an object
- * @object: Object description
  * @will_modify: If cache is expected to be modified locally
  *
  * Request usage of the cookie attached to an object.  The caller should tell
@@ -272,7 +271,6 @@ static inline void fscache_use_cookie(struct fscache_cookie *cookie,
 
 /**
  * fscache_unuse_cookie - Cease usage of cookie attached to an object
- * @object: Object description
  * @aux_data: Updated auxiliary data (or NULL)
  * @object_size: Revised size of the object (or NULL)
  *
-- 
2.25.1


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

